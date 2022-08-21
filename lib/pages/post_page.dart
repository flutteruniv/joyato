import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
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
            const TextField(),
            const Text('内容'),
            const TextField(),
            ElevatedButton(onPressed: () {}, child: const Text('投稿する'))
          ],
        ),
      ),
    );
  }
}
