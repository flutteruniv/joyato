import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

import 'domain/post.dart';
import 'pages/post_page.dart';

const String post = 'posts';

/// FireStoreインスタンスをプロバイドする Provider
final firestoreProvider = Provider((ref) => FirebaseFirestore.instance);

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

class PostRepository {
  PostRepository(this._read);
  final Reader _read;

  late final firestore = _read(firestoreProvider);
  late final refarence = firestore.collection(post);
  late final titleController = _read(titleControllerStateProvider);
  late final bodyController = _read(bodyControllerStateProvider);

  late final postConverter = refarence.withConverter<Post>(
      fromFirestore: (ds, _) => Post.fromDocumentSnapshot(ds),
      toFirestore: (post, _) => post.toJson());

  Future<Post?> storePostData() async {
    final titel = titleController.text;
    final body = bodyController.text;
    final postDocRef = postConverter.doc();

    // final post = Post(
    // title: titel,
    // body: body,
    // name: ,
    // uid: ,
    // createdAt: ,
    // );

    // await postDocRef.set(post);
    return null;
  }
}
