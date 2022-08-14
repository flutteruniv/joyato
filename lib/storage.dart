import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'domain/account.dart';

const String accounts = 'accounts';

// Documentsが格納されているか確認し関数を分岐して実行する
Future<Object?> checkDocuments(UserCredential userCredential) async {
  final uid = userCredential.user!.uid;
  final document = await returnDocument(uid);

  // documentがNullでない場合はそのままdocumentを返す
  if (document != null) {
    return document;
  }
  // Nullの場合は格納する関数を実行し戻り値を返す
  final storedDocument = await storeUserData(userCredential);
  return storedDocument;
}

// userDataを「accounts」コレクションに格納する関数
Future<Object?> storeUserData(UserCredential userCredential) async {
  final uid = userCredential.user!.uid;
  final photoURL = userCredential.user!.photoURL;
  final displayName = userCredential.user!.displayName;

  final userDocRef = FirebaseFirestore.instance.collection(accounts).doc(uid);

  final account = Account(
    name: displayName!,
    joined: null,
    photoURL: photoURL!,
  );
  await userDocRef.set(
    account.toJson(),
  );
  // 格納後にSnapShotを返す
  final returnSnapshot = await returnDocument(uid);
  return returnSnapshot;
}

// 仮引数で受け取ったuidを使い、DocumentSnapshotを返す関数
Future<Map<String, dynamic>?> returnDocument(String uid) async {
  final docSnapshot =
      await FirebaseFirestore.instance.collection(accounts).doc(uid).get();
  return docSnapshot.data();
}
