import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/post.dart';

class DisplayPage extends ConsumerWidget {
  DisplayPage({super.key, required this.post});
  Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('灯'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(children: [Text(post.title)]),
        ));
  }
}
