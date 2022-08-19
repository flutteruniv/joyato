import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// Firebase.instanceをプロバイドした変数
final firebaseAuthProvider = Provider<FirebaseAuth>(
  (ref) => FirebaseAuth.instance,
);

/// GoogleSignInをプロバイドした変数
final googleSignInProvider = Provider(
  (ref) => GoogleSignIn(),
);

/// AuthRepositoryクラスをプロバイドした変数
final authRepositoryProvider = Provider((ref) {
  return AuthRepository(ref.read);
});

final authStateChangesProvider = StreamProvider<User?>((ref) {
  return ref.read(firebaseAuthProvider).authStateChanges();
});

class AuthRepository {
  AuthRepository(this._read);
  final Reader _read;

  late final firebaseAuth = _read(firebaseAuthProvider);
  late final googleSignIn = _read(googleSignInProvider);

  Future<void> singOut() async {
    await googleSignIn.signOut();
    await firebaseAuth.signOut();
  }

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
}
