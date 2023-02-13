import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListPostsPage extends StatefulWidget {
  const ListPostsPage({super.key});

  @override
  State<ListPostsPage> createState() => _HomePageState();
}

class _HomePageState extends State<ListPostsPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF101010),
        appBar: AppBar(
          backgroundColor: const Color(0xFF101010),
          title: Text(
            '投稿一覧',
            style: GoogleFonts.zenMaruGothic(
              fontSize: 20,
              color: const Color(0xFFFFFFFF),
              fontWeight: FontWeight.w500,
            ),
          ),
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
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 330,
              height: 150,
              decoration: BoxDecoration(
                color: Color(0xFF1C1C1C),
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 1,
                    blurRadius: 3,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5, left: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              'https://ca.slack-edge.com/T0179KMH83U-U01UFRZGT6C-a1438c135013-512',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          children: [
                            Text(
                              'takaku1222',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '2023/12/22 10:00',
                              style: TextStyle(
                                  color: Color(0xFF7D7D7D), fontSize: 9),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 150,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 2),
                    child: Row(
                      children: [
                        Text(
                          'こんばんは\nこの場所お気に入り',
                          style: GoogleFonts.zenMaruGothic(
                            fontSize: 15,
                            color: const Color(0xFFFFFFFF),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 250),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.pink,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5, right: 2),
                          child: Text(
                            '10',
                            style: GoogleFonts.zenMaruGothic(
                              fontSize: 17,
                              color: const Color(0xFF7D7D7D),
                            ),
                          ),
                        ),
                      ],
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
