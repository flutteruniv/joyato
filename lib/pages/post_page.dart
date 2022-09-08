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
        onWillPop: () {Navigator.of(context).pop(false);
    return Future.value(false);},
        child:
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('投稿'),
            //leading: const Icon(Icons.arrow_back),
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
                        await postRepository
                            .storePinToPostCorrection(geoFirePoint);
                        //postRepository.initializeTextEditingController();
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

  Future<bool> _backButtonPress(BuildContext context) async {
    final answer = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Dialog'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text('No')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: const Text('Yes'))
            ],
          );
        });

    return answer ?? false;
  }
}
