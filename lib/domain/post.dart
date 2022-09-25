import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../json_converters.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  // ignore: invalid_annotation_target
  factory Post({
    required String title,
    required String body,
    required String name,
    @Default('') photoURL,
    required String uid,
    @DocumentReferenceConverter() DocumentReference? reference,
    @AutoTimestampConverter() DateTime? createdAt,
    @GeoFirePointConverter() required GeoPoint position,
    required String geoHash,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  factory Post.fromDocumentSnapshot(DocumentSnapshot ds) {
    final data = Map<String, dynamic>.from(ds.data()! as Map);
    return Post.fromJson(data);
  }

  factory Post.fromCollectionSnapshot(CollectionReference cr) {
    final data = cr.doc() as Map<String, dynamic>;
    return Post.fromJson(data);
  }
}
