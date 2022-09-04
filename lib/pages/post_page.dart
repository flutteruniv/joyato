import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../storage/post_storage.dart';

class PostingPage extends ConsumerWidget {
  PostingPage({super.key, required this.geoPoint});
  GeoPoint geoPoint;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postRepository = ref.read(postsRepositoryProvider);
    final titleControllerProvider =
        ref.watch(titleControllerStateProvider.state);
    final bodyControllerProvider = ref.watch(bodyControllerStateProvider.state);
    var isLoading = false;
    final navigator = Navigator.of(context);

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('投稿'),
          ),
          body: Center(
            child: Column(
              children: [
                const Text('タイトル'),
                TextFormField(
                  controller: titleControllerProvider.state,
                ),
                const Text('内容'),
                TextFormField(
                  controller: bodyControllerProvider.state,
                ),
                ElevatedButton(
                    onPressed: () async {
                      // ToDO. ピン情報を更新しなかった場合の動作を実装する
                      try {
                        isLoading = true;
                        await postRepository.updatePin(geoPoint);
                        navigator.pop();
                      } catch (e) {
                        final snackBar = SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(e.toString()),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } finally {
                        isLoading = false;
                      }
                    },
                    child: const Text('投稿する'))
              ],
            ),
          ),
        ),
        if (isLoading)
          const ColoredBox(
            color: Colors.black54,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }
}
