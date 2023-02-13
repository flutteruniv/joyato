import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:joyato/map_page.dart';
import 'package:joyato/register_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  Future<UserCredential> signInWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    final UserCredential result =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final user = result.user;
    final users = user?.uid;

    FirebaseFirestore.instance.collection('billing').doc(users).set({
      'uid': users,
      'coinAmount': 100,
    });
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF101010),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 700,
                width: 500,
                child: Image.asset('assets/images/タイトル.png'),
              ),
              const SizedBox(
                height: 0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 74,
                    width: 172,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                          const Color(0xFFF8DBAA),
                        ),
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              alignment: Alignment.center,
                              height: 780,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Color(0xFF101010),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 15),
                                        child: IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(
                                            Icons.clear_outlined,
                                            color: Colors.white,
                                            size: 25,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'ログイン',
                                    style: GoogleFonts.zenMaruGothic(
                                      fontSize: 22,
                                      color: const Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w500,
                                    ),
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
                                          fontSize: 14,
                                          color: const Color(0xFF424347),
                                        ),
                                        filled: true,
                                        fillColor: const Color(0xFF1F2123),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        border: InputBorder.none,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
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
                                            fontSize: 14,
                                            color: const Color(0xFF424347)),
                                        filled: true,
                                        fillColor: const Color(0xFF1F2123),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        border: InputBorder.none,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
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
                                        backgroundColor:
                                            const Color(0xFFF8DBAA),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const MapPage(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'ログイン',
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
                                        backgroundColor:
                                            const Color(0xFFFFFFFF),
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
                            );
                          },
                        );
                      },
                      child: Text(
                        'ログイン',
                        style: GoogleFonts.zenMaruGothic(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    height: 74,
                    width: 172,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                          const Color(0xFFF8DBAA),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                      child: Text(
                        'はじめる',
                        style: GoogleFonts.zenMaruGothic(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
