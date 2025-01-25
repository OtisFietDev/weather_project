import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_entity.freezed.dart';
part 'sign_in_entity.g.dart';

@freezed
class SignInEntity with _$SignInEntity {
  const factory SignInEntity({
    required String email,
    required String password,
  }) = _SignInEntity;

  factory SignInEntity.fromJson(Map<String, dynamic> json) => _$SignInEntityFromJson(json);
}
