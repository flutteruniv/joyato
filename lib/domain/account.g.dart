// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Account _$$_AccountFromJson(Map<String, dynamic> json) => _$_Account(
      name: json['name'] as String,
      photoURL: json['photoURL'] as String,
      createdAt: const AutoTimestampConverter().fromJson(json['createdAt']),
      coin: json['coin'] ?? 0,
    );

Map<String, dynamic> _$$_AccountToJson(_$_Account instance) =>
    <String, dynamic>{
      'name': instance.name,
      'photoURL': instance.photoURL,
      'createdAt': const AutoTimestampConverter().toJson(instance.createdAt),
      'coin': instance.coin,
    };
