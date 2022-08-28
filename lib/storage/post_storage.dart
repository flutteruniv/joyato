import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

import '../auth/auth.dart';
import '../domain/post.dart';

const String posts = 'posts';

/// FireStoreインスタンスをプロバイドする Provider
final firestoreProvider = Provider((ref) => FirebaseFirestore.instance);

/// title の TextEditingController を提供する Provider
final titleControllerStateProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

/// body の TextEditingController を提供する Provider
final bodyControllerStateProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

//final geoProvider = Provider((ref) => Geoflutterfire());

final geo = Geoflutterfire();
final _firestore = FirebaseFirestore.instance;
GeoFirePoint myLocation = geo.point(latitude: 35.675, longitude: 139.780);

void addPositon() async {
  await _firestore
      .collection('locations')
      .add({'name': 'random name', 'position': myLocation.data});
}

/// PostRepositoryをプロバイドする Provider
final postsRepositoryProvider = Provider((ref) {
  return PostRepository(ref.read);
});

/// Post情報を格納するリポジトリ
class PostRepository {
  PostRepository(this._read);
  final Reader _read;

  late final firestore = _read(firestoreProvider);

  late final user = _read(userProvider).value;
  late final titleController = _read(titleControllerStateProvider);
  late final bodyController = _read(bodyControllerStateProvider);

  // Postsに関する変数
  late final postsRef = firestore.collection(posts);
  late final postsConverter = postsRef.withConverter<Post>(
      fromFirestore: (ds, _) => Post.fromDocumentSnapshot(ds),
      toFirestore: (post, _) => post.toJson());

  /// PostDataを「posts」コレクションに格納する関数
  Future<void> storePostData() async {
    final titel = titleController.text;
    final body = bodyController.text;
    final postDocRef = postsConverter;

    if (user == null) {
      throw 'ログインしていません';
    }

    final post = Post(
      title: titel,
      body: body,
      name: user!.displayName ?? '',
      uid: user!.uid,
      createdAt: null,
    );

    await postDocRef.add(post);
  }
}
