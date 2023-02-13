import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'SignIn_page.dart';

class SigninOutPage extends StatefulWidget {
  const SigninOutPage({super.key});

  @override
  State<SigninOutPage> createState() => _HomePageState();
}

class _HomePageState extends State<SigninOutPage> {
  Future<void> singOut() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('サインアウト'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
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
          },
          child: const Text('Googleサインアウト'),
        ),
      ),
    );
  }
}