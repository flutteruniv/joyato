import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../storage/post_storage.dart';

class PostingPage extends ConsumerWidget {
  const PostingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleControllerProvider = ref.read(titleControllerStateProvider);
    final bodyControllerProvider = ref.read(bodyControllerStateProvider);
    late final postRepository = ref.read(postsRepositoryProvider);

    return Scaffold(
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
              controller: titleControllerProvider,
            ),
            const Text('内容'),
            TextFormField(
              controller: bodyControllerProvider,
            ),
            ElevatedButton(
                onPressed: () async {
                  await postRepository.storePostData();
                },
                child: const Text('投稿する'))
          ],
        ),
      ),
    );
  }
}
