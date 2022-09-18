import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth/auth.dart';
import '../storage/account_storage.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authRepository = ref.read(authRepositoryProvider);
    final accountRepository = ref.read(accountRepositoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('サインイン'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
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
            await authRepository.signInWithGoogle();
            await accountRepository.storeAccountData();
            navigator.pop();
          },
          child: const Text('Googleサインイン'),
        ),
      ),
    );
  }
}
