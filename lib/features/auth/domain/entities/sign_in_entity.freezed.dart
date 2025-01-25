// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SignInEntity _$SignInEntityFromJson(Map<String, dynamic> json) {
  return _SignInEntity.fromJson(json);
}

/// @nodoc
mixin _$SignInEntity {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignInEntityCopyWith<SignInEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInEntityCopyWith<$Res> {
  factory $SignInEntityCopyWith(
          SignInEntity value, $Res Function(SignInEntity) then) =
      _$SignInEntityCopyWithImpl<$Res, SignInEntity>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$SignInEntityCopyWithImpl<$Res, $Val extends SignInEntity>
    implements $SignInEntityCopyWith<$Res> {
  _$SignInEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignInEntityImplCopyWith<$Res>
    implements $SignInEntityCopyWith<$Res> {
  factory _$$SignInEntityImplCopyWith(
          _$SignInEntityImpl value, $Res Function(_$SignInEntityImpl) then) =
      __$$SignInEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$SignInEntityImplCopyWithImpl<$Res>
    extends _$SignInEntityCopyWithImpl<$Res, _$SignInEntityImpl>
    implements _$$SignInEntityImplCopyWith<$Res> {
  __$$SignInEntityImplCopyWithImpl(
      _$SignInEntityImpl _value, $Res Function(_$SignInEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$SignInEntityImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignInEntityImpl implements _SignInEntity {
  const _$SignInEntityImpl({required this.email, required this.password});

  factory _$SignInEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignInEntityImplFromJson(json);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'SignInEntity(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInEntityImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInEntityImplCopyWith<_$SignInEntityImpl> get copyWith =>
      __$$SignInEntityImplCopyWithImpl<_$SignInEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignInEntityImplToJson(
      this,
    );
  }
}

abstract class _SignInEntity implements SignInEntity {
  const factory _SignInEntity(
      {required final String email,
      required final String password}) = _$SignInEntityImpl;

  factory _SignInEntity.fromJson(Map<String, dynamic> json) =
      _$SignInEntityImpl.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$SignInEntityImplCopyWith<_$SignInEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
