import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      home: Scaffold(
        backgroundColor: Color(0xFF101010),
        appBar: AppBar(
          backgroundColor: Color(0xFF101010),
          title: Text(
            '投稿',
            style: GoogleFonts.zenMaruGothic(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 20),
              child: Text(
                '完了',
                style: GoogleFonts.zenMaruGothic(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
          elevation: 0,
        ),
        body: TextFormField(
          keyboardType: TextInputType.multiline,
          maxLines: null,
          style: const TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'あなたの思いを刻みましょう。',
            hintStyle: GoogleFonts.zenMaruGothic(
              fontSize: 14,
              color: const Color(0xFF424347),
            ),
          ),
          autofocus: true,
          cursorColor: const Color(0xFFF8DBAA),
        ),
      ),
    );
  }
}
