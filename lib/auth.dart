import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<UserCredential> signInWithGoogle() async {
  final googleUser = await GoogleSignIn().signIn();
  final googleAuth = await googleUser?.authentication;
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );
  final userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);
  return userCredential;
}

Future<void> singOut() async {
  await GoogleSignIn().signOut();
  await FirebaseAuth.instance.signOut();
}
