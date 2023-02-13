import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joyato/map_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF101010),
        appBar: AppBar(
          backgroundColor: Color(0xFF101010),
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'アカウント登録',
                    style: GoogleFonts.zenMaruGothic(
                      fontSize: 22,
                      color: const Color(0xFFFFFFFF),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: 327,
                height: 53,
                child: TextFormField(
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintText: 'メールアドレス',
                    hintStyle: GoogleFonts.zenMaruGothic(
                        fontSize: 14, color: const Color(0xFF424347)),
                    filled: true,
                    fillColor: const Color(0xFF1F2123),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  cursorColor: const Color(0xFFF8DBAA),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 327,
                height: 53,
                child: TextFormField(
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintText: 'パスワード',
                    hintStyle: GoogleFonts.zenMaruGothic(
                        fontSize: 14, color: const Color(0xFF424347)),
                    filled: true,
                    fillColor: const Color(0xFF1F2123),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  cursorColor: const Color(0xFFF8DBAA),
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: 327,
                height: 53,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF8DBAA),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MapPage()),
                    );
                  },
                  child: Text(
                    'メールアドレスで作成',
                    style: GoogleFonts.zenMaruGothic(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30.0,
                    width: 150,
                    child: Divider(
                      color: Color(0xFF424347),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    'または',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF424347),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const SizedBox(
                    height: 30.0,
                    width: 150,
                    child: Divider(
                      color: Color(0xFF424347),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 327,
                height: 53,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFFFFF),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      SizedBox(
                        height: 30,
                        width: 50,
                        child: Image.network(
                            'https://flutter-ui.s3.us-east-2.amazonaws.com/social_media_buttons/google-icon.png'),
                      ),
                      const SizedBox(width: 30),
                      Text(
                        'Googleでサインイン',
                        style: GoogleFonts.zenMaruGothic(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
