import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../json_converter_helper.dart';

import '../json_converters.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  // ignore: invalid_annotation_target
  @allJsonConvertersSerializable
  factory Post({
    required String title,
    required String body,
    required String name,
    @Default('') photoURL,
    required String uid,
    required DocumentReference<JsonMap> documentReference,
    @AutoTimestampConverter() DateTime? createdAt,
    @GeoFirePointConverter() Map<String, Object>? position,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  factory Post.fromDocumentSnapshot(DocumentSnapshot ds) {
    final data = ds.data()! as Map<String, dynamic>;
    return Post.fromJson(data);
  }
}
