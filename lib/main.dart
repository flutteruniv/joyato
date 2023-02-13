import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:joyato/SignIn_page.dart';
import 'package:joyato/posts_page.dart';
import 'package:joyato/profile_page.dart';
import 'map_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return const MaterialApp(
        home: MapPage(),
      );
    }
    return const MaterialApp(
      home: MapPage(),
    );
  }
}
