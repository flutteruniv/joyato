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
      documentReference: const DocumentReferenceConverter()
          .fromJson(json['documentReference'] as DocumentReference<Post>),
      createdAt: const AutoTimestampConverter().fromJson(json['createdAt']),
      position:
          _$JsonConverterFromJson<Map<String, Object>, Map<String, Object>>(
              json['position'], const GeoFirePointConverter().fromJson),
    );

Map<String, dynamic> _$$_PostToJson(_$_Post instance) => <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'name': instance.name,
      'photoURL': instance.photoURL,
      'uid': instance.uid,
      'documentReference':
          const DocumentReferenceConverter().toJson(instance.documentReference),
      'createdAt': const AutoTimestampConverter().toJson(instance.createdAt),
      'position':
          _$JsonConverterToJson<Map<String, Object>, Map<String, Object>>(
              instance.position, const GeoFirePointConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
