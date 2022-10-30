import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/post.dart';

class DisplayPage extends ConsumerWidget {
  const DisplayPage({super.key, required this.post});
  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          title: const Text('詳細ページ'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(children: [
            Text(post.title),
            Text(post.body),
          ]),
        ));
  }
}
