import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'domain/account.dart';

const String accounts = 'accounts';

final firestoreProvider = Provider((ref) => FirebaseFirestore.instance);

final accountRepositoryProvider = Provider((ref) {
  return AccountRepository(ref.read);
});



class AccountRepository {
  AccountRepository(this._read);
  final Reader _read;

  late final firestore = _read(firestoreProvider);
  late final refarence = firestore.collection(accounts);
  late final accountConverter = refarence.withConverter<Account>(
      fromFirestore: (ds, _) => Account.fromDocumentSnapshot(ds),
      toFirestore: (account, _) => account.toJson());

/// Documentsが格納されているか確認し関数を分岐して実行する
  Future<Object?> checkDocuments(UserCredential userCredential) async {
    final uid = userCredential.user!.uid;
    final document = await fetchByUid(uid);

    /// documentがNullでない場合はそのままdocumentを返す
    if (document != null) {
      return document;
    }
    /// Nullの場合は格納する関数を実行し戻り値を返す
    final storedDocument = await storeUserData(userCredential);
    return storedDocument;
  }

  /// userDataを「accounts」コレクションに格納する関数
  Future<Object?> storeUserData(UserCredential userCredential) async {
    final uid = userCredential.user!.uid;
    final photoURL = userCredential.user!.photoURL;
    final displayName = userCredential.user!.displayName;
    final userDocRef = accountConverter.doc(uid);

    final account = Account(
      name: displayName!,
      createdAt: null,
      photoURL: photoURL!,
    );

    await userDocRef.set(account);
    // 格納後にSnapShotを返す
    final returnSnapshot = await fetchByUid(uid);
    return returnSnapshot;
  }

  // 仮引数で受け取ったuidを使い、DocumentSnapshotを返す関数
  Future<Map<String, dynamic>?> fetchByUid(String uid) async {
    final docSnapshot =
        await FirebaseFirestore.instance.collection(accounts).doc(uid).get();
    return docSnapshot.data();
  }
}
