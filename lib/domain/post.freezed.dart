// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
mixin _$Post {
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  dynamic get photoURL => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  @DocumentReferenceConverter()
  DocumentReference<Object?>? get reference =>
      throw _privateConstructorUsedError;
  @AutoTimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @GeoFirePointConverter()
  GeoPoint get position => throw _privateConstructorUsedError;
  String get geoHash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res>;
  $Res call(
      {String title,
      String body,
      String name,
      dynamic photoURL,
      String uid,
      @DocumentReferenceConverter() DocumentReference<Object?>? reference,
      @AutoTimestampConverter() DateTime? createdAt,
      @GeoFirePointConverter() GeoPoint position,
      String geoHash});
}

/// @nodoc
class _$PostCopyWithImpl<$Res> implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  final Post _value;
  // ignore: unused_field
  final $Res Function(Post) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? body = freezed,
    Object? name = freezed,
    Object? photoURL = freezed,
    Object? uid = freezed,
    Object? reference = freezed,
    Object? createdAt = freezed,
    Object? position = freezed,
    Object? geoHash = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photoURL: photoURL == freezed
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as dynamic,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      reference: reference == freezed
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as GeoPoint,
      geoHash: geoHash == freezed
          ? _value.geoHash
          : geoHash // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_PostCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$_PostCopyWith(_$_Post value, $Res Function(_$_Post) then) =
      __$$_PostCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      String body,
      String name,
      dynamic photoURL,
      String uid,
      @DocumentReferenceConverter() DocumentReference<Object?>? reference,
      @AutoTimestampConverter() DateTime? createdAt,
      @GeoFirePointConverter() GeoPoint position,
      String geoHash});
}

/// @nodoc
class __$$_PostCopyWithImpl<$Res> extends _$PostCopyWithImpl<$Res>
    implements _$$_PostCopyWith<$Res> {
  __$$_PostCopyWithImpl(_$_Post _value, $Res Function(_$_Post) _then)
      : super(_value, (v) => _then(v as _$_Post));

  @override
  _$_Post get _value => super._value as _$_Post;

  @override
  $Res call({
    Object? title = freezed,
    Object? body = freezed,
    Object? name = freezed,
    Object? photoURL = freezed,
    Object? uid = freezed,
    Object? reference = freezed,
    Object? createdAt = freezed,
    Object? position = freezed,
    Object? geoHash = freezed,
  }) {
    return _then(_$_Post(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photoURL: photoURL == freezed ? _value.photoURL : photoURL,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      reference: reference == freezed
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as GeoPoint,
      geoHash: geoHash == freezed
          ? _value.geoHash
          : geoHash // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Post implements _Post {
  _$_Post(
      {required this.title,
      required this.body,
      required this.name,
      this.photoURL = '',
      required this.uid,
      @DocumentReferenceConverter() this.reference,
      @AutoTimestampConverter() this.createdAt,
      @GeoFirePointConverter() required this.position,
      required this.geoHash});

  factory _$_Post.fromJson(Map<String, dynamic> json) => _$$_PostFromJson(json);

  @override
  final String title;
  @override
  final String body;
  @override
  final String name;
  @override
  @JsonKey()
  final dynamic photoURL;
  @override
  final String uid;
  @override
  @DocumentReferenceConverter()
  final DocumentReference<Object?>? reference;
  @override
  @AutoTimestampConverter()
  final DateTime? createdAt;
  @override
  @GeoFirePointConverter()
  final GeoPoint position;
  @override
  final String geoHash;

  @override
  String toString() {
    return 'Post(title: $title, body: $body, name: $name, photoURL: $photoURL, uid: $uid, reference: $reference, createdAt: $createdAt, position: $position, geoHash: $geoHash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Post &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.body, body) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.photoURL, photoURL) &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.reference, reference) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.position, position) &&
            const DeepCollectionEquality().equals(other.geoHash, geoHash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(body),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(photoURL),
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(reference),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(position),
      const DeepCollectionEquality().hash(geoHash));

  @JsonKey(ignore: true)
  @override
  _$$_PostCopyWith<_$_Post> get copyWith =>
      __$$_PostCopyWithImpl<_$_Post>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostToJson(
      this,
    );
  }
}

abstract class _Post implements Post {
  factory _Post(
      {required final String title,
      required final String body,
      required final String name,
      final dynamic photoURL,
      required final String uid,
      @DocumentReferenceConverter() final DocumentReference<Object?>? reference,
      @AutoTimestampConverter() final DateTime? createdAt,
      @GeoFirePointConverter() required final GeoPoint position,
      required final String geoHash}) = _$_Post;

  factory _Post.fromJson(Map<String, dynamic> json) = _$_Post.fromJson;

  @override
  String get title;
  @override
  String get body;
  @override
  String get name;
  @override
  dynamic get photoURL;
  @override
  String get uid;
  @override
  @DocumentReferenceConverter()
  DocumentReference<Object?>? get reference;
  @override
  @AutoTimestampConverter()
  DateTime? get createdAt;
  @override
  @GeoFirePointConverter()
  GeoPoint get position;
  @override
  String get geoHash;
  @override
  @JsonKey(ignore: true)
  _$$_PostCopyWith<_$_Post> get copyWith => throw _privateConstructorUsedError;
}
