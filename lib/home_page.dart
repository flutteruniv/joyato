import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:joyato/SignIn_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = Completer<GoogleMapController>();
  final _markers = <Marker>{};
  final initLatLng = const LatLng(35.675, 139.770);
  final double maxZoomLevel = 18;
  final double minZoomLevel = 6;
  late final _initPosition = CameraPosition(target: initLatLng, zoom: 14.0);

  Future<void> singOut() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ホームページ'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              onPressed:
              () async {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                );
                await singOut();
                if (!mounted) {
                  return;
                }
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) {
                    return const SignInPage();
                  }),
                  (route) => false,
                );
              };
            },
          )
        ],
      ),
      body: GoogleMap(
        mapType: MapType.terrain,
        initialCameraPosition: _initPosition,
        markers: _markers,
        minMaxZoomPreference: MinMaxZoomPreference(minZoomLevel, maxZoomLevel),
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
