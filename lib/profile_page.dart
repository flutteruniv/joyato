import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joyato/edit_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          splashColor: Colors.transparent, highlightColor: Colors.transparent),
      debugShowMaterialGrid: false,
      home: Scaffold(
        backgroundColor: Color(0xFF101010),
        appBar: AppBar(
          backgroundColor: Color(0xFF101010),
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    GestureDetector(
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(
                          'https://ca.slack-edge.com/T0179KMH83U-U01UFRZGT6C-a1438c135013-512',
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EditPage(),
                            fullscreenDialog: true,
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 10),
                    Text(
                      'takaku1222',
                      style: GoogleFonts.zenMaruGothic(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '12月22日',
                      style: GoogleFonts.zenMaruGothic(
                        fontSize: 12,
                        color: Color(0xFF7D7D7D),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'トイザらス',
                      style: GoogleFonts.zenMaruGothic(
                        fontSize: 12,
                        color: Color(0xFF7D7D7D),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          '2',
                          style: GoogleFonts.zenMaruGothic(
                            fontSize: 16,
                            color: Color(0xFFF8DBAA),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          width: 200,
                        ),
                        Text(
                          '12',
                          style: GoogleFonts.zenMaruGothic(
                            fontSize: 16,
                            color: Color(0xFFF8DBAA),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          child: Text(
                            '思いを刻んだ数',
                            style: GoogleFonts.zenMaruGothic(
                              fontSize: 12,
                              color: Color(0xFF8FA0B4),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 150,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            'いいね数',
                            style: GoogleFonts.zenMaruGothic(
                              fontSize: 12,
                              color: Color(0xFF8FA0B4),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '投稿',
                      style: GoogleFonts.zenMaruGothic(
                        fontSize: 15,
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
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
                                Text(
                                  '2023/12/22 10:00',
                                  style: TextStyle(
                                    color: Color(0xFF7D7D7D),
                                  ),
                                ),
                                SizedBox(
                                  width: 150,
                                ),
                                IconButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      backgroundColor:
                                          Color(0xFF1C1C1C), //これを追加した
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(15)),
                                      ),
                                      builder: (BuildContext context) {
                                        return Container(
                                          height: 250,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Text(
                                                '思いを消しますか？',
                                                style:
                                                    GoogleFonts.zenMaruGothic(
                                                  fontSize: 17,
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 50,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    width: 100,
                                                    height: 50,
                                                    child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            const Color(
                                                                0xFF7D7D7D),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        'いいえ',
                                                        style: GoogleFonts
                                                            .zenMaruGothic(
                                                          fontSize: 15,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  SizedBox(
                                                    width: 100,
                                                    height: 50,
                                                    child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            const Color(
                                                                0xFFF8DBAA),
                                                      ),
                                                      onPressed: () {},
                                                      child: Text(
                                                        'はい',
                                                        style: GoogleFonts
                                                            .zenMaruGothic(
                                                          fontSize: 15,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  icon: Icon(Icons.more_horiz),
                                  color: Color(0xFF7D7D7D),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Text(
                                  'こんばんは\nこの場所お気に入りです!',
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
                                  padding: const EdgeInsets.only(
                                      bottom: 5, right: 2),
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
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 330,
                      height: 490,
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
                                Text(
                                  '2023/11/12 13:00',
                                  style: TextStyle(
                                    color: Color(0xFF7D7D7D),
                                  ),
                                ),
                                SizedBox(
                                  width: 150,
                                ),
                                IconButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      backgroundColor:
                                          Color(0xFF1C1C1C), //これを追加した
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(15)),
                                      ),
                                      builder: (BuildContext context) {
                                        return Container(
                                          height: 250,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Text(
                                                '思いを消しますか？',
                                                style:
                                                    GoogleFonts.zenMaruGothic(
                                                  fontSize: 17,
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 50,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    width: 100,
                                                    height: 50,
                                                    child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            const Color(
                                                                0xFF7D7D7D),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        'いいえ',
                                                        style: GoogleFonts
                                                            .zenMaruGothic(
                                                          fontSize: 15,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  SizedBox(
                                                    width: 100,
                                                    height: 50,
                                                    child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            const Color(
                                                                0xFFF8DBAA),
                                                      ),
                                                      onPressed: () {},
                                                      child: Text(
                                                        'はい',
                                                        style: GoogleFonts
                                                            .zenMaruGothic(
                                                          fontSize: 15,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  icon: Icon(Icons.more_horiz),
                                  color: Color(0xFF7D7D7D),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Text(
                                  '11月12日\n美味しいハンバーグを求めて\n美味しかった。また来たい',
                                  style: GoogleFonts.zenMaruGothic(
                                    fontSize: 15,
                                    color: const Color(0xFFFFFFFF),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 300,
                            width: 300,
                            child: Image.network(
                              'https://pbs.twimg.com/profile_images/1621099890922356736/_EqHfuRE_400x400.jpg',
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
                                  padding: const EdgeInsets.only(
                                      bottom: 5, right: 2),
                                  child: Text(
                                    '5',
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
            ],
          ),
        ),
      ),
    );
  }
}
