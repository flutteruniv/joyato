/// 参考：
/// https://github.com/mono0926/flutter_firestore_ref
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:json_annotation/json_annotation.dart';

import 'bool.dart';

class PassthroughConverter<T> implements JsonConverter<T, Object?> {
  const PassthroughConverter();

  @override
  T fromJson(Object? json) => json as T;

  @override
  Object? toJson(T object) => object;
}

class DocumentReferenceConverter
    implements JsonConverter<DocumentReference, DocumentReference> {
  const DocumentReferenceConverter();

  @override
  DocumentReference fromJson(DocumentReference reference) => reference;

  @override
  DocumentReference toJson(DocumentReference reference) => reference;
}

class NullableDocumentReferenceConverter<T>
    implements
        JsonConverter<DocumentReference<T>?, DocumentReference<Object?>?> {
  const NullableDocumentReferenceConverter();

  @override
  DocumentReference<T>? fromJson(DocumentReference<Object?>? ref) =>
      ref as DocumentReference<T>?;

  @override
  DocumentReference? toJson(DocumentReference<T>? ref) => ref;
}

class GeoPointConverter implements JsonConverter<GeoPoint, GeoPoint> {
  const GeoPointConverter();

  @override
  GeoPoint fromJson(GeoPoint geopoint) => geopoint;

  @override
  GeoPoint toJson(GeoPoint geopoint) => geopoint;
}

class GeoFirePointConverter
    implements JsonConverter<GeoFirePoint, Map<String, Object>> {
  const GeoFirePointConverter();

  @override
  GeoFirePoint fromJson(Map<String, Object> json) {
    final geoPoint = json['geopoint'] as GeoPoint;
    final geoFire = Geoflutterfire();

    final geoFirePoint = geoFire.point(
        latitude: geoPoint.latitude, longitude: geoPoint.longitude);
    return geoFirePoint;
  }

  @override
  Map<String, Object> toJson(GeoFirePoint geofirepoint) {
    final geoPoint = geofirepoint.geoPoint;
    return {
      'geohash': geofirepoint.hash,
      'geopoint': geoPoint,
    };
  }
}

/// Firestore ドキュメントには FieldValue.serverTimestamp() を、
/// Dart のインスタンスとしては DateTime を与える。
/// タイムスタンプのコンバータ。
class AutoTimestampConverter implements JsonConverter<DateTime?, dynamic> {
  const AutoTimestampConverter();

  @override
  DateTime? fromJson(dynamic json) {
    if (json is Timestamp) {
      return json.toDate();
    }
    return null;
  }

  /// toJson、つまり、書き込みのためにインスタンスを生成してドキュメント化する時は
  /// TimestampConverter のフィールドは FieldValue.serverTimestamp() に自動で置換する。
  @override
  dynamic toJson(DateTime? object) => object == null
      ? FieldValue.serverTimestamp()
      : Timestamp.fromDate(object);
}

/// Firestore ドキュメントには FieldValue.serverTimestamp() を、
/// Dart のインスタンスとしては toIso8601String() した文字列を与える
/// タイムスタンプのコンバータ
class AutoTimestampIso8601StringConverter
    implements JsonConverter<String?, dynamic> {
  const AutoTimestampIso8601StringConverter();

  @override
  String? fromJson(dynamic json) {
    if (json is Timestamp) {
      return json.toDate().toIso8601String();
    }
    return null;
  }

  /// toJson、つまり、書き込みのためにインスタンスを生成してドキュメント化する時は
  /// TimestampConverter のフィールドは FieldValue.serverTimestamp() に自動で置換する。
  @override
  dynamic toJson(String? object) => object == null
      ? FieldValue.serverTimestamp()
      : Timestamp.fromDate(DateTime.parse(object));
}

/// 自動で Iso8601String の DateTime を付与するコンバータ。
/// Firestore ODM が Timestamp 型の orderBy に対応していないので使用する。
class AutoDateTimeIso8601StringConverter
    implements JsonConverter<String?, String> {
  const AutoDateTimeIso8601StringConverter();

  @override
  String? fromJson(String json) => json;

  /// toJson、つまり、書き込みのためにインスタンスを生成してドキュメント化する時は
  /// TimestampConverter のフィールドは FieldValue.serverTimestamp() に自動で置換する。
  @override
  String toJson(String? object) => object ?? DateTime.now().toIso8601String();
}

/// Firestore では Map<String, FieldValue.serverTimestamp()> として扱うフィールドを、
/// Dart のインスタンスとしては Map<String DateTime> で使用するためのコンバータ。
class AutoTimestampValueMapConverter
    implements JsonConverter<Map<String, DateTime?>, dynamic> {
  const AutoTimestampValueMapConverter();

  @override
  Map<String, DateTime?> fromJson(dynamic json) {
    final m = <String, DateTime>{};
    if (json is Map) {
      for (final key in json.keys) {
        if (key is String) {
          try {
            m[key] = (json[key] as Timestamp).toDate();
          } on Exception {
            // return m;
            m[key] = DateTime.now();
          }
        }
      }
    }
    return m;
  }

  /// toJson、つまり、書き込みのためにインスタンスを生成してドキュメント化する時は
  /// Map のバリューは FieldValue.serverTimestamp() に自動で置換する。
  @override
  dynamic toJson(Map<String, DateTime?> object) {
    final m = <String, dynamic>{};
    for (final key in object.keys) {
      try {
        final value = object[key];
        m[key] = value == null
            ? FieldValue.serverTimestamp()
            : Timestamp.fromDate(value);
      } on Exception {
        return m;
      }
    }

    return m;
  }
}

/// エポック秒で int の値を与えるコンバータ
/// 後から追加すると数が大きくなる表示順序などのフィールド (e.g. order) などに使用する
class AutoSecondsSinceEpochConverter implements JsonConverter<int?, int> {
  const AutoSecondsSinceEpochConverter();

  @override
  int? fromJson(int json) => json;

  /// toJson、つまり、書き込みのためにインスタンスを生成してドキュメント化する時は
  /// 例えば 2022-01-01 12:00:00 のときは、20220101120000 に置換した整数を保存する
  @override
  int toJson(int? object) =>
      object ?? DateTime.now().millisecondsSinceEpoch * 1000;
}

/// デフォルト false で Firestore に書き込む bool 型のためのコンバータ。
class DefaultFalseConverter implements JsonConverter<bool?, dynamic> {
  const DefaultFalseConverter();

  @override
  bool? fromJson(dynamic json) => toBool(json);

  /// toJson、つまり、書き込みのためにインスタンスを生成してドキュメント化する時は
  /// 指定がなければ defaultValue にする。
  @override
  bool toJson(bool? object) => object ?? false;
}

/// デフォルト false で Firestore に書き込む bool 型のためのコンバータ。
class DefaultIntConverter implements JsonConverter<int?, dynamic> {
  const DefaultIntConverter({this.defaultValue = 3});

  final int defaultValue;

  @override
  int? fromJson(dynamic json) {
    if (json is int) {
      return json;
    }
    return defaultValue;
  }

  /// toJson、つまり、書き込みのためにインスタンスを生成してドキュメント化する時は
  /// 指定がなければ defaultValue にする。
  @override
  int toJson(int? object) => object ?? defaultValue;
}
