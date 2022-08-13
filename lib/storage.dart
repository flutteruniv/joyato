import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'pages/account.dart';

Future<void> storeUserData(UserCredential userCredential) async {
  if (userCredential.user != null) {
    final uid = userCredential.user!.uid;
    final photoURL = userCredential.user!.photoURL;
    final displayName = userCredential.user!.displayName;
    final userDoc = FirebaseFirestore.instance.collection('accounts').doc(uid);

    final account = Account(
      name: displayName!,
      joined: null,
      photoURL: photoURL!,
    );
    await userDoc.set(
      account.toJson(),
    );
  }
}
