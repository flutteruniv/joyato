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
      reference: _$JsonConverterFromJson<DocumentReference<Object?>,
              DocumentReference<Object?>>(
          json['reference'], const DocumentReferenceConverter().fromJson),
      createdAt: const AutoTimestampConverter().fromJson(json['createdAt']),
      position:
          const GeoFirePointConverter().fromJson(json['position'] as GeoPoint),
      geoHash: json['geoHash'] as String,
    );

Map<String, dynamic> _$$_PostToJson(_$_Post instance) => <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'name': instance.name,
      'photoURL': instance.photoURL,
      'uid': instance.uid,
      'reference': _$JsonConverterToJson<DocumentReference<Object?>,
              DocumentReference<Object?>>(
          instance.reference, const DocumentReferenceConverter().toJson),
      'createdAt': const AutoTimestampConverter().toJson(instance.createdAt),
      'position': const GeoFirePointConverter().toJson(instance.position),
      'geoHash': instance.geoHash,
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
