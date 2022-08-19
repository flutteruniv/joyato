import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auth.dart';
import 'pages/home_page.dart';
import 'pages/sign_in_page.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ToDo(kenta-wakasa): SingInPageとHomePageの出し分けをgo_routerを用いた方法に変更したい
    final home = ref.watch(authStateChangesProvider).when<Widget>(
      data: (user) {
        if (user == null) {
          return const SignInPage();
        }
        return const HomePage();
      },
      error: (e, stackTrace) {
        return const Scaffold();
      },
      loading: () {
        return const Scaffold();
      },
    );
    return MaterialApp(home: home);
  }
}

