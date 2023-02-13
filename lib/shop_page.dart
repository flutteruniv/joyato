import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF101010),
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Color(0xFF101010),
            elevation: 0,
            title: Text(
              'ポイント',
              style: GoogleFonts.zenMaruGothic(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: const Padding(
                    padding: EdgeInsets.only(left: 17),
                    child: FaIcon(
                      FontAwesomeIcons.circleQuestion,
                      color: Color(0xFFF8DBAA),
                      size: 25,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ]),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Color(0xFF101010),
                child: Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, bottom: 50, top: 30),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://ca.slack-edge.com/T0179KMH83U-U01UFRZGT6C-a1438c135013-512',
                        ),
                        radius: 40,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'takaku1222',
                            style: GoogleFonts.zenMaruGothic(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 30, bottom: 10),
                                child: Row(
                                  children: [
                                    Stack(
                                      children: [
                                        SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: Image.asset(
                                            'assets/images/コイン.png',
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 5),
                                      child: Text(
                                        '120',
                                        style: GoogleFonts.zenMaruGothic(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, bottom: 10),
                    child: Text(
                      'チャージする',
                      style: GoogleFonts.zenMaruGothic(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              ListWidget(
                text: 'x120',
                buttonText: '￥160',
              ),
              SizedBox(
                height: 10,
              ),
              ListWidget(
                text: 'x240',
                buttonText: '￥320',
              ),
              SizedBox(
                height: 10,
              ),
              ListWidget(
                text: 'x360',
                buttonText: '￥480',
              ),
              SizedBox(
                height: 10,
              ),
              ListWidget(
                text: 'x480',
                buttonText: '￥640',
              ),
              SizedBox(
                height: 10,
              ),
              ListWidget(
                text: 'x600',
                buttonText: '￥800',
              ),
              SizedBox(
                height: 10,
              ),
              ListWidget(
                text: 'x720',
                buttonText: '￥960',
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListWidget extends StatelessWidget {
  const ListWidget({
    Key? key,
    required this.text,
    required this.buttonText,
  }) : super(key: key);

  final String text;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: Container(
        height: 70,
        width: 350,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xFF1C1C1C),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [],
        ),
        child: ListTile(
          leading: Image.asset('assets/images/コイン.png'),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Row(
              children: [
                Text(
                  text,
                  style: GoogleFonts.zenMaruGothic(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 120,
                ),
                SizedBox(
                  width: 70,
                  height: 43,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF8DBAA),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      buttonText,
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
        ),
      ),
    );
  }
}
