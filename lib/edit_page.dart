import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joyato/profile_page.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
        backgroundColor: Color(0xFF101010),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      'https://ca.slack-edge.com/T0179KMH83U-U01UFRZGT6C-a1438c135013-512',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 270, top: 30),
                    child: Row(
                      children: [
                        Text(
                          '名前',
                          style: GoogleFonts.zenMaruGothic(
                            fontSize: 15,
                            color: Color(0xFF7D7D7D),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 327,
                    height: 53,
                    child: TextFormField(
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
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
                  Padding(
                    padding: const EdgeInsets.only(right: 260, top: 30),
                    child: Row(
                      children: [
                        Text(
                          '誕生日',
                          style: GoogleFonts.zenMaruGothic(
                            fontSize: 15,
                            color: Color(0xFF7D7D7D),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 327,
                    height: 53,
                    child: TextFormField(
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
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
                  Padding(
                    padding: const EdgeInsets.only(right: 230, top: 30),
                    child: Row(
                      children: [
                        Text(
                          '好きな場所',
                          style: GoogleFonts.zenMaruGothic(
                            fontSize: 15,
                            color: Color(0xFF7D7D7D),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 327,
                    height: 53,
                    child: TextFormField(
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
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
                  SizedBox(
                    height: 150,
                  ),
                  SizedBox(
                    width: 327,
                    height: 53,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF8DBAA),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        '保存',
                        style: GoogleFonts.zenMaruGothic(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
