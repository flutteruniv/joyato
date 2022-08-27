// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$$_PostFromJson(Map<String, dynamic> json) => _$_Post(
      title: json['title'] as String,
      body: json['body'] as String,
      name: json['name'] as String,
      photoURL: json['photoURL'] ?? '',
      uid: json['uid'] as String,
      createdAt: const AutoTimestampConverter().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$$_PostToJson(_$_Post instance) => <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'name': instance.name,
      'photoURL': instance.photoURL,
      'uid': instance.uid,
      'createdAt': const AutoTimestampConverter().toJson(instance.createdAt),
    };
