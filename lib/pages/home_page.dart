import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../auth/auth.dart';
import '../storage/post_storage.dart';
import 'post_page.dart';
import 'sign_in_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late final authRepository = ref.read(authRepositoryProvider);

  /// zoomレベルの最小値・最大値
  static const _maxZoomLevel = 18.0;
  static const _minZoomLevel = 6.0;
  static const _miMinMaxZoomPreference = MinMaxZoomPreference(
    _minZoomLevel,
    _maxZoomLevel,
  );
  // 地図上に表示するマーカー
  final Set<Marker> _markers = {};
  final Set<Marker> _localMarkers = {};

  /// 地図初期配置
  static const _initLatLng = LatLng(35.675, 139.770);
  static const _initPosition = CameraPosition(target: _initLatLng, zoom: 14.0);

  final _controller = Completer<GoogleMapController>();

  @override
  void initState() {
    super.initState();
  }

  /// サインアウト後に [SignInPage] に遷移する
  Future<void> signOut() async {
    final navigator = Navigator.of(context);
    unawaited(
      showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
    await authRepository.singOut();
    if (!mounted) {
      return;
    }
    navigator.pop();
  }

  @override
  Widget build(BuildContext context) {
    final postAsyncValue = ref.watch(postStreamProvider);
    return Stack(
      children: [
        postAsyncValue.when(
          loading: () => Stack(
            children: const [
              Center(child: CircularProgressIndicator()),
            ],
          ),
          data: (postValue) {
            final postDocs = postValue.docs;
            final geoPointList = postDocs.map((postDoc) {
              final geoPoint = postDoc['position']['geopoint'] as GeoPoint;
              return geoPoint;
            }).toList();

            geoPointList.map((GeoPoint geoPoint) {
              final geo = Geoflutterfire();
              final geoFirePoint = geo.point(
                  latitude: geoPoint.latitude, longitude: geoPoint.longitude);
              final geoLatitude = geoPoint.latitude;
              final geoLongitude = geoPoint.longitude;
              final marker = Marker(
                markerId: MarkerId(geoPoint.latitude.toString() +
                    geoPoint.longitude.toString()),
                position: LatLng(geoLatitude, geoLongitude),
                onTap: () => movePostPage(geoFirePoint),
              );
              _markers.add(marker);
            }).toSet();

            return Scaffold(
              appBar: AppBar(
                title: const Text('ホームページ'),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.exit_to_app),
                    onPressed: () => signOut(),
                  )
                ],
              ),
              body: GoogleMap(
                mapType: MapType.terrain,
                initialCameraPosition: _initPosition,
                markers: _markers.union(_localMarkers),
                minMaxZoomPreference: _miMinMaxZoomPreference,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                onMapCreated: (controller) {
                  _controller.complete(controller);
                },
                onTap: (latLng) {
                  try {
                    final geo = Geoflutterfire();
                    final geoFirePoint = geo.point(
                        latitude: latLng.latitude, longitude: latLng.longitude);
                    final marker = Marker(
                      markerId: const MarkerId('local'),
                      position: latLng,
                      onTap: () => movePostPage(geoFirePoint),
                    );
                    setState(() {
                      _localMarkers.add(marker);
                    });
                    // await postRepository.storePinToPostCorrection(geoFirePoint);

                    // TODO(odaken): 本当にgeoFirePointProviderを使用するべきか検討する
                    ref
                        .watch(geoFirePointProvider.notifier)
                        .update((state) => geoFirePoint);
                  } catch (e) {
                    Text(
                      e.toString(),
                    );
                  } finally {}
                },
              ),
            );
          },
          error: ((error, stackTrace) => Text('Error: $error')),
        ),
      ],
    );
  }

  /// Canvasを使用しマーカーを作成する関数
  // TODO(odaken): マーカーの見た目を変更する際に使用するため残す
  Future<void> canvasMarkerCreate(LatLng latLng) async {
    /// 初期Canvasサイズ
    final markerIcon = await getBytesFromCanvas(100, 100);
    const infoWindow = InfoWindow(
        //title: '投稿する',
        //onTap: writeToPin(),
        );
    final marker = Marker(
      infoWindow: infoWindow,
      markerId: MarkerId(latLng.toString()),
      icon: BitmapDescriptor.fromBytes(markerIcon),
      position: latLng,
      //onTap: () => movePostsPage(),
    );

    setState(() {
      _markers.add(marker);
    });
  }

  /// [PostPage]に遷移する
  void movePostPage(GeoFirePoint geoFirePoint) async {
    final isCreated = await Navigator.of(context).push(MaterialPageRoute<bool>(
        builder: (context) => PostPage(
              geoFirePoint: geoFirePoint,
            )));
    if (isCreated == false) {
      setState(() {
        _localMarkers.clear();
      });
    }
  }

  /// localMarkerを作成する関数
  void localMarkerCreate(LatLng latLng) {
    final geo = Geoflutterfire();
    final geoFirePoint =
        geo.point(latitude: latLng.latitude, longitude: latLng.longitude);
    final marker = Marker(
      markerId: MarkerId(latLng.toString()),
      position: latLng,
      onTap: () => movePostPage(geoFirePoint),
    );

    setState(() {
      _markers.add(marker);
    });
  }
}

/// 引数からUint8List型でCancvasをリターンする関数
Future<Uint8List> getBytesFromCanvas(int width, int height) async {
  final pictureRecorder = ui.PictureRecorder();
  final canvas = Canvas(pictureRecorder);
  final paint = Paint()..color = Colors.red;
  const radius = Radius.circular(30.0);
  const text = 'P';
  const textStyle = TextStyle(fontSize: 25.0, color: Colors.white);

  canvas.drawRRect(
      RRect.fromRectAndCorners(
        Rect.fromLTWH(0.0, 0.0, width.toDouble(), height.toDouble()),
        topLeft: radius,
        topRight: radius,
        bottomLeft: radius,
        bottomRight: radius,
      ),
      paint);

  final painter = TextPainter(textDirection: TextDirection.ltr);
  painter.text = const TextSpan(
    text: text,
    style: textStyle,
  );
  painter.layout();
  painter.paint(
      canvas,
      Offset((width * 0.5) - painter.width * 0.5,
          (height * 0.5) - painter.height * 0.5));
  final img = await pictureRecorder.endRecording().toImage(width, height);
  final data = await img.toByteData(format: ui.ImageByteFormat.png);
  return data!.buffer.asUint8List();
}
