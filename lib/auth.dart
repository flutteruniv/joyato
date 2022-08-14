import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final googleSignInProvider = Provider<GoogleSignIn>(
  (ref) => GoogleSignIn(),
);

final authRepositoryProvider = Provider((ref) {
  return AuthRepository(ref.read);
});

class AuthRepository {
  AuthRepository(this._read);
  final Reader _read;

  /// プロバイドされたFirebaseAuthのインスタンス
  late final firebaseAuth = _read(firebaseAuthProvider);

  late final googleSignIn = _read(googleSignInProvider);

  Future<UserCredential> signInWithGoogle() async {
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    final userCredential = await firebaseAuth.signInWithCredential(credential);
    return userCredential;
  }

  Future<void> singOut() async {
    await googleSignIn.signOut();
    await firebaseAuth.signOut();
  }
}

final authStateChangesProvider = StreamProvider<User?>((ref) {
  return ref.read(firebaseAuthProvider).authStateChanges();
});
