import 'package:cloud_firestore/cloud_firestore.dart'; //これがないと型解決できない
import 'package:freezed_annotation/freezed_annotation.dart';

import '../json_converters.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@freezed
class Account with _$Account {
  const Account._(); // メソッドを追加するので、コンストラクタを追加
  const factory Account({
    required String name,
    required String photoURL,
    @AutoTimestampConverter() DateTime? createdAt,
    @Default(0) coin,
  }) = _Account;
  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  factory Account.fromDocumentSnapshot(DocumentSnapshot ds) {
    final data = ds.data()! as Map<String, dynamic>;
    return Account.fromJson(data);
  }
}
