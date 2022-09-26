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
    StateProvider<TextEditingController>((ref) {
  return TextEditingController(text: '');
});

/// body の TextEditingController を提供する StateProvider
final bodyControllerStateProvider = StateProvider<TextEditingController>((ref) {
  return TextEditingController(text: '');
});

/// PostsコレクションのSnapShotを提供する StreamProvider
final postStreamProvider = StreamProvider<QuerySnapshot<Post>>((ref) {
  return ref
      .read(firestoreProvider)
      .collection(posts)
      .withConverter<Post>(
          fromFirestore: (ds, _) => Post.fromDocumentSnapshot(ds),
          toFirestore: (post, _) => post.toJson())
      .snapshots();
});

/// PostsコレクションのSnapShotを提供する StreamProvider
// final postDocFamily =
//     FutureProvider.family<DocumentSnapshot<Post>, String>((ref, referenceId) {
//   return ref
//       .read(firestoreProvider)
//       .collection(posts)
//       .doc(referenceId)
//       .withConverter<Post>(
//           fromFirestore: (ds, _) => Post.fromDocumentSnapshot(ds),
//           toFirestore: (post, _) => post.toJson())
//       .get();
// });

/// GeoFirePointを提供する StateProvider
final geoFirePointProvider = StateProvider.autoDispose<GeoFirePoint?>((ref) {
  GeoFirePoint? geoFirePoint;
  return geoFirePoint;
});

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

  /// Pin情報を更新する関数
  Future<void> updatePin(GeoPoint geoPoint) async {
    final postId = geoPoint.latitude.toString() + geoPoint.longitude.toString();
    final postDocRef = postsRef.doc(postId);
    final title = titleController.text;
    final body = bodyController.text;

    await postDocRef.update(
      {
        'title': title,
        'body': body,
        'createdAt': FieldValue.serverTimestamp(),
      },
    );
  }

  /// PostDataを[posts]コレクションに格納する関数
  Future<void> storePinToPostCorrection(GeoFirePoint geoFirePoint) async {
    final title = titleController.text;
    final body = bodyController.text;
    final postCollectionRef = postsConverter;
    final docRef = postCollectionRef.doc();

    if (user == null) {
      throw 'ログインしていません';
    }
    print('🚅$docRef');

    final post = Post(
      title: title,
      body: body,
      name: user!.displayName ?? '',
      uid: user!.uid,
      createdAt: null,
      position: geoFirePoint.geoPoint,
      geoHash: geoFirePoint.hash,
      reference: docRef,
    );
    await docRef.set(post);
    initializeTextEditingController();
  }

  // [TextEditingController]を初期化
  void initializeTextEditingController() {
    titleController.clear();
    bodyController.clear();
  }
}
