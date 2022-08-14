import 'package:cloud_firestore/cloud_firestore.dart'; //これがないと型解決できない
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@freezed
class Account with _$Account {
  const Account._(); // メソッドを追加するので、コンストラクタを追加
  const factory Account({
    required String name,
    required String photoURL,
    @AutoTimestampConverter() DateTime? joined,
    @Default(0) coin,
  }) = _Account;
  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  factory Account.fromDocumentSnapshot(DocumentSnapshot ds) {
    final data = ds.data()! as Map<String, dynamic>;
    return Account.fromJson(data);
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
