import 'dart:async';

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

  /// 地図初期配置
  static const _initLatLng = LatLng(35.675, 139.770);
  static const _initPosition = CameraPosition(target: _initLatLng, zoom: 14.0);

  /// GoogleMapコントローラー
  final googleMapController = Completer<GoogleMapController>();

  /// FireStoreから生成したマーカー群
  Set<Marker> markersGeneratedFromFire = {};

  /// Geoflutterfireインスタンス
  final geoFire = Geoflutterfire();

  /// Mapをタップ時に表示するマーカー
  Marker? localMarker;

  @override
  void initState() {
    super.initState();
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
            final allMarkers = localMarker == null
                ? markersGeneratedFromFire
                : <Marker>{localMarker!, ...markersGeneratedFromFire};

            final postDocs = postValue.docs;
            markersGeneratedFromFire = postDocs.map((post) {
              final geoPoint = post['position']['geopoint'] as GeoPoint;
              final reference = post['documentReference'] as DocumentReference;
              final geoFirePoint = geoFire.point(
                  latitude: geoPoint.latitude, longitude: geoPoint.longitude);
              final marker = Marker(
                markerId: MarkerId(reference.id),
                position: LatLng(geoPoint.latitude, geoPoint.longitude),
                onTap: () => movePostPage(geoFirePoint),
              );
              return marker;
            }).toSet();

            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
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
                  markers:
                      allMarkers, // markersGeneratedFromFireとlocalMarkerを含めたマーカー群
                  minMaxZoomPreference: _miMinMaxZoomPreference,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  onMapCreated: (controller) {
                    googleMapController.complete(controller);
                  },
                  // Tapで地図上にマーカーを立てる
                  onTap: (latLng) {
                    try {
                      final geoFirePoint = geoFire.point(
                          latitude: latLng.latitude,
                          longitude: latLng.longitude);
                      final tapMarker = Marker(
                        markerId: const MarkerId('local-marker'),
                        position: latLng,
                        onTap: () => movePostPage(geoFirePoint),
                      );
                      localMarker = tapMarker;
                      setState(() {});
                      // TODO(odaken): 本当にgeoFirePointProviderを使用するべきか検討する
                      // ref
                      //     .watch(geoFirePointProvider.notifier)
                      //     .update((state) => geoFirePoint);
                    } catch (error) {
                      final snackBar = SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                            '読み込みがうまくいきませんでした。もう一度お試しください\n${error.toString()}'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } finally {}
                  },
                  // LongPressで地図上のローカルマーカーを消す
                  // ダイヤログに変えても良いと思う
                  onLongPress: (_) {
                    setState(() {
                      localMarker = null;
                    });
                  }),
            );
          },
          error: ((error, stackTrace) => Text('Error: $error')),
        ),
      ],
    );
  }

  // Canvasを使用しマーカーを作成する関数
  // TODO(odaken): マーカーの見た目を変更する際に使用するため残す
  // Future<void> canvasMarkerCreate(LatLng latLng) async {
  //   /// 初期Canvasサイズ
  //   final markerIcon = await getBytesFromCanvas(100, 100);
  //   const infoWindow = InfoWindow(
  //       //title: '投稿する',
  //       //onTap: writeToPin(),
  //       );
  //   final marker = Marker(
  //     infoWindow: infoWindow,
  //     markerId: const MarkerId('local-marker'),
  //     icon: BitmapDescriptor.fromBytes(markerIcon),
  //     position: latLng,
  //     //onTap: () => movePostsPage(),
  //   );
  //   setState(() {
  //     markersGeneratedFromFire.add(marker);
  //   });
  // }

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

  /// [PostPage]に遷移する
  void movePostPage(GeoFirePoint geoFirePoint) async {
    final shouldDelete =
        await Navigator.of(context).push(MaterialPageRoute<bool>(
            builder: (context) => PostPage(
                  geoFirePoint: geoFirePoint,
                )));
    // 投稿せずに戻ってきた場合、localMarkerを削除する
    if (shouldDelete == true) {
      setState(() {
        localMarker = null;
      });
    }
  }
}

// 引数からUint8List型でCancvasをリターンする関数
// Future<Uint8List> getBytesFromCanvas(int width, int height) async {
//   final pictureRecorder = ui.PictureRecorder();
//   final canvas = Canvas(pictureRecorder);
//   final paint = Paint()..color = Colors.red;
//   const radius = Radius.circular(30.0);
//   const text = 'P';
//   const textStyle = TextStyle(fontSize: 25.0, color: Colors.white);

//   canvas.drawRRect(
//       RRect.fromRectAndCorners(
//         Rect.fromLTWH(0.0, 0.0, width.toDouble(), height.toDouble()),
//         topLeft: radius,
//         topRight: radius,
//         bottomLeft: radius,
//         bottomRight: radius,
//       ),
//       paint);

//   final painter = TextPainter(textDirection: TextDirection.ltr);
//   painter.text = const TextSpan(
//     text: text,
//     style: textStyle,
//   );
//   painter.layout();
//   painter.paint(
//       canvas,
//       Offset((width * 0.5) - painter.width * 0.5,
//           (height * 0.5) - painter.height * 0.5));
//   final img = await pictureRecorder.endRecording().toImage(width, height);
//   final data = await img.toByteData(format: ui.ImageByteFormat.png);
//   return data!.buffer.asUint8List();
// }
