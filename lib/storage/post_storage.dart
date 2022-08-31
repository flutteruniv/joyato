import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

import '../auth/auth.dart';
import '../domain/post.dart';

const String posts = 'posts';

/// FireStoreインスタンスをプロバイドする Provider
final firestoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

/// title の TextEditingController を提供する StateProvider
final titleControllerStateProvider =
    StateProvider.autoDispose<TextEditingController>((ref) {
  return TextEditingController(text: '');
});

/// body の TextEditingController を提供する StateProvider
final bodyControllerStateProvider =
    StateProvider.autoDispose<TextEditingController>((ref) {
  return TextEditingController(text: '');
});

// final titleResponseProvider = Provider.autoDispose<String>(
//     (ref) => ref.watch(titleControllerStateProvider).value.text);

//final geoProvider = Provider((ref) => Geoflutterfire());

final geo = Geoflutterfire();
final _firestore = FirebaseFirestore.instance;
GeoFirePoint myLocation = geo.point(latitude: 35.675, longitude: 139.780);

Future<void> addPositon() async {
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
      position: myLocation.data,
    );

    await postDocRef.add(post);
  }
}
