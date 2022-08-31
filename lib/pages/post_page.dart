import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../storage/post_storage.dart';

class PostingPage extends ConsumerWidget {
  const PostingPage({super.key});

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
                // const Text('画像'),
                // GestureDetector(
                //   child: Container(
                //     color: Colors.green,
                //     width: 200,
                //     height: 200,
                //   ),
                //   onTap: () {
                //   },
                // ),
                // if (ref.watch(postResponseFutureProvider).isLoading) ...[
                //   const CircularProgressIndicator(),
                // ],
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
                        await postRepository.storePostData();
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
