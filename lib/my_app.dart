import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'pages/sign_in_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO(kenta-wakasa): SingInPageとHomePageの出し分けをgo_routerを用いた方法に変更したい
    final currentUser = FirebaseAuth.instance.currentUser;
    final home = currentUser == null ? const SignInPage() : const HomePage();
    return MaterialApp(
      home: home,
    );
  }
}
