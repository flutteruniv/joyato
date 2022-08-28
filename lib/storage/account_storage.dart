import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth/auth.dart';
import '../domain/account.dart';

const String accounts = 'accounts';
const String posts = 'posts';

/// FireStoreインスタンスをプロバイドする Provider
final _firestoreProvider = Provider((ref) => FirebaseFirestore.instance);

/// AccountRepositoryをプロバイドする Provider
final accountRepositoryProvider = Provider((ref) {
  return AccountRepository(ref.read);
});

///
class AccountRepository {
  AccountRepository(this._read);
  final Reader _read;

  late final firestore = _read(_firestoreProvider);
  late final user = _read(userProvider).value;
  late final accounsRef = firestore.collection(accounts);
  late final accountsConverter = accounsRef.withConverter<Account>(
      fromFirestore: (ds, _) => Account.fromDocumentSnapshot(ds),
      toFirestore: (account, _) => account.toJson());

  /// Documentを確認し、存在しなければ格納する関数
  Future<void> checkBeforeStoring() async {
    final docSnapshot = await fetchByUid();

    if (docSnapshot == null) {
      await storeAccountData();
    }
  }

  /// AccountDataを「accounts」コレクションに格納する関数
  Future<void> storeAccountData() async {
    final uid = user?.uid;
    final name = user?.displayName;
    final photoURL = user?.photoURL;
    final accountDocRef = accountsConverter.doc(uid);

    final account = Account(
      name: name!,
      createdAt: null,
      photoURL: photoURL!,
    );
    await accountDocRef.set(account);
  }

  /// Uidを使用しDocumentSnapshotを返す関数
  Future<Account?> fetchByUid() async {
    if (user == null) {
      throw 'ログインが行われていません';
    }

    final docSnapshot = await accountsConverter.doc(user!.uid).get();

    if (docSnapshot.data() == null) {
      return null;
    }
    return docSnapshot.data();
  }
}
