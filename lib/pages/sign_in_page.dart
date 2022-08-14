import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth.dart';
import '../storage.dart';
import 'home_page.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('サインイン'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
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
            final userCredential = await signInWithGoogle();

            await checkDocuments(userCredential);

            await Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) {
                return const HomePage();
              }),
              (route) => false,
            );
          },
          child: const Text('Googleサインイン'),
        ),
      ),
    );
  }
}
