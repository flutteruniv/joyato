import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../auth.dart';
import 'sign_in_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
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

  final _controller = Completer<GoogleMapController>();
  final _markers = <Marker>{};

  late final authRepository = ref.read(authRepositoryProvider);

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
        markers: _markers,
        minMaxZoomPreference: _miMinMaxZoomPreference,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        onMapCreated: (controller) {
          _controller.complete(controller);
        },

        /// onTap時に [canvasMarkerCreate] を実行する
        onTap: (latLng) async {
          await canvasMarkerCreate(latLng);
        },
      ),
    );
  }

  /// CanvasMarkerを作成する関数
  Future<void> canvasMarkerCreate(LatLng latLng) async {
    /// 初期Canvasサイズ
    final markerIcon = await getBytesFromCanvas(50, 50);

    final initMarker = Marker(
      markerId: MarkerId(latLng.toString()),
      icon: BitmapDescriptor.fromBytes(markerIcon),
      position: latLng,
      //onTap: () => onTapCanvasCallBack(latLng),
    );

    setState(() {
      _markers.add(initMarker);
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
