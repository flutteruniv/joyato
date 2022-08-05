import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:joyato/home_page.dart';
import 'package:joyato/sign_in_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;

    // currentUserがnullならログインしていない
    // その場合はSingInPageを表示する
    if (currentUser == null) {
      return const MaterialApp(
        home: SignInPage(),
      );
    }

    return const MaterialApp(
      home: HomePage(),
    );
  }
}
