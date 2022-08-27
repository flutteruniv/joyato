import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../post_storage.dart';

final titleControllerStateProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});
final bodyControllerStateProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

class PostingPage extends ConsumerWidget {
  const PostingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleControllerProvider = ref.watch(titleControllerStateProvider);
    final bodyControllerProvider = ref.watch(bodyControllerStateProvider);
    late final postRepository = ref.read(postsRepositoryProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('投稿'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('画像'),
            GestureDetector(
              child: Container(
                color: Colors.green,
                width: 200,
                height: 200,
              ),
              onTap: () {
                print('🤡');
              },
            ),
            const Text('タイトル'),
            TextFormField(
              controller: titleControllerProvider,
            ),
            const Text('内容'),
            TextFormField(
              controller: bodyControllerProvider,
            ),
            ElevatedButton(
                onPressed: () {
                  postRepository.storePostData();
                },
                child: const Text('投稿する'))
          ],
        ),
      ),
    );
  }
}
