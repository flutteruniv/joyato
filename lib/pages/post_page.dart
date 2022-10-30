import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

import '../storage/post_storage.dart';

// ignore: must_be_immutable
class PostPage extends ConsumerWidget {
  PostPage({super.key, required this.geoFirePoint});
  GeoFirePoint geoFirePoint;

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
        WillPopScope(
          // 投稿画面Pop時に前の画面にTrueを返す
          onWillPop: () {
            navigator.pop(true);
            return Future.value(false);
          },
          child: Scaffold(
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
                        try {
                          isLoading = true;
                          await postRepository
                              .storePinToPostCorrection(geoFirePoint);
                          // 投稿が行われた場合、前の画面にTrueを返す
                          navigator.pop(true);
                        } catch (e) {
                          final snackBar = SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(e.toString()),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          // エクセプションが行われた場合前の画面にFalseを返す
                          navigator.pop(false);
                        } finally {
                          isLoading = false;
                        }
                      },
                      child: const Text('投稿する')),
                      
                ],
              ),
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
