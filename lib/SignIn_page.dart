import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
      debugShowMaterialGrid: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF15202b),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: 800,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'JoYaTo',
                          style: TextStyle(
                            fontSize: 45.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow[200],
                          ),
                        ),
                        Text(
                          "-場所に思いを刻む SNS-",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                            color: Colors.yellow[200],
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                          width: 150.0,
                          child: Divider(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 350,
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            decoration: const InputDecoration(
                              hintText: 'メールアドレス',
                              hintStyle:
                                  TextStyle(fontSize: 20, color: Colors.grey),
                              fillColor: Colors.white12,
                              filled: true,
                              prefixIcon:
                                  Icon(Icons.mail, color: Color(0xFF8c94b8)),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        SizedBox(
                          width: 350,
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            decoration: const InputDecoration(
                              hintText: 'パスワード',
                              hintStyle:
                                  TextStyle(fontSize: 20, color: Colors.grey),
                              fillColor: Colors.white12,
                              filled: true,
                              prefixIcon: Icon(
                                Icons.key,
                                color: Color(0xFF8c94b8),
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              child: SizedBox(
                                width: 170,
                                height: 80,
                                child: Card(
                                  color: Color(0xFFfff59d),
                                  child: Center(
                                    child: Text(
                                      'ログイン',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: SizedBox(
                                width: 170,
                                height: 80,
                                child: Card(
                                  color: Color(0xFFfff59d),
                                  child: Center(
                                    child: Text(
                                      '新規登録',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 30.0,
                              width: 100,
                              child: Divider(
                                color: Colors.teal[100],
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text(
                              'または',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.white38),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              height: 30.0,
                              width: 100,
                              child: Divider(
                                color: Colors.teal[100],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Googleアカウントでログイン',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow[200],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
