import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joyato/list_post.dart';
import 'package:joyato/post.dart';
import 'package:joyato/profile_page.dart';
import 'package:joyato/shop_page.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      home: Scaffold(
        backgroundColor: Color(0xFF101010),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 49, left: 15),
                    child: IconButton(
                      onPressed: () {},
                      icon: const FaIcon(
                        FontAwesomeIcons.circleQuestion,
                        color: Color(0xFF3A393C),
                        size: 35,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 250,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 53, left: 15),
                    child: GestureDetector(
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://ca.slack-edge.com/T0179KMH83U-U01UFRZGT6C-a1438c135013-512',
                        ),
                        radius: 18,
                      ),
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Color(0xFF1C1C1C),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(15)),
                          ),
                          builder: (BuildContext context) {
                            return SizedBox(
                              height: 250,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        child: CircleAvatar(
                                          radius: 50,
                                          backgroundColor: Color(0xFF373737),
                                          child: FaIcon(
                                            FontAwesomeIcons.gear,
                                            size: 35,
                                            color: Color(0xFFF8DBAA),
                                          ),
                                        ),
                                        onTap: () {},
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '設定',
                                        style: GoogleFonts.zenMaruGothic(
                                          fontSize: 16,
                                          color: Color(0xFFF8DBAA),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        child: CircleAvatar(
                                          radius: 50,
                                          backgroundColor: Color(0xFF3A393C),
                                          child: FaIcon(
                                            FontAwesomeIcons.solidUser,
                                            size: 35,
                                            color: Color(0xFFF8DBAA),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ProfilePage(),
                                            ),
                                          );
                                        },
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'マイページ',
                                        style: GoogleFonts.zenMaruGothic(
                                          fontSize: 16,
                                          color: Color(0xFFF8DBAA),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        child: CircleAvatar(
                                          radius: 50,
                                          backgroundColor: Color(0xFF3A393C),
                                          child: FaIcon(
                                            FontAwesomeIcons.cartShopping,
                                            size: 35,
                                            color: Color(0xFFF8DBAA),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ShopPage()),
                                          );
                                        },
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '購入',
                                        style: GoogleFonts.zenMaruGothic(
                                          fontSize: 16,
                                          color: Color(0xFFF8DBAA),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              GestureDetector(
                child: Container(
                  height: 200,
                  width: 200,
                  color: Color(0xFF1C1C1C),
                ),
                onLongPress: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Color(0xFF1C1C1C),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15)),
                    ),
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 250,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Color(0xFF373737),
                                    child: FaIcon(
                                      FontAwesomeIcons.mapLocationDot,
                                      size: 35,
                                      color: Color(0xFFF8DBAA),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ListPostsPage(),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '投稿一覧',
                                  style: GoogleFonts.zenMaruGothic(
                                    fontSize: 16,
                                    color: Color(0xFFF8DBAA),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Color(0xFF3A393C),
                                    child: FaIcon(
                                      FontAwesomeIcons.pencil,
                                      size: 35,
                                      color: Color(0xFFF8DBAA),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PostPage(),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '投稿する',
                                  style: GoogleFonts.zenMaruGothic(
                                    fontSize: 16,
                                    color: Color(0xFFF8DBAA),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
