// ignore: depend_on_referenced_packages
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? errorMessage;

  const Failure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class PlatformFailure extends Failure {
  const PlatformFailure([super.errorMessage]);
}

/// General failures
class ServerFailure extends Failure {
  final int? statusCode;

  const ServerFailure([super.errorMessage, this.statusCode = 500]);
}

/// Cancel token failure
class CancelTokenFailure extends Failure {
  final int? statusCode;

  const CancelTokenFailure([super.errorMessage, this.statusCode = 500]);
}

class UserCanceledFailure extends Failure {
  final int? statusCode;

  const UserCanceledFailure([super.errorMessage, this.statusCode = 500]);
}

/// FlutterSecureStorage write failure
class StorageWriteFailure extends Failure {
  final dynamic exception;

  const StorageWriteFailure([super.errorMessage, this.exception]);
}

/// FlutterSecureStorage read failure
class StorageReadFailure extends Failure {
  const StorageReadFailure([super.errorMessage]);
}

/// JWT decode failure
class JWTDecodeFailure extends Failure {
  const JWTDecodeFailure([super.errorMessage]);
}

class NoDataFailure extends Failure {
  const NoDataFailure([super.errorMessage]);
}

// 잘못된 요청
class BadRequestFailure extends Failure {
  const BadRequestFailure([super.errorMessage]);
}

class UnsupportedFailure extends Failure {
  const UnsupportedFailure([super.errorMessage]);
}

class NotFoundUserFailure extends Failure {
  const NotFoundUserFailure([super.errorMessage]);
}

class InvalidTokenFailure extends Failure {
  const InvalidTokenFailure([super.errorMessage]);
}

// 잘못된 닉네임 형식
class InvalidNicknameFailure extends Failure {
  const InvalidNicknameFailure([super.errorMessage]);
}

// 중복 닉네임
class DuplicatedNicknameFailure extends Failure {
  const DuplicatedNicknameFailure([super.errorMessage]);
}

// 닉네임에 금칙어 포함
class ForbiddenWordInNicknameFailure extends Failure {
  const ForbiddenWordInNicknameFailure([super.errorMessage]);
}

// 이미 가입한 회원
class AlreadyRegisteredUserFailure extends Failure {
  const AlreadyRegisteredUserFailure([super.errorMessage]);
}

/// 잘못된 비밀번호 형식
class ForbiddenPasswordFormFailure extends Failure {
  const ForbiddenPasswordFormFailure([super.errorMessage]);
}

class CenterNotFoundFailure extends Failure {
  const CenterNotFoundFailure([super.errorMessage]);
}

// 잘못된 비밀번호
class InvalidPasswordFailure extends Failure {
  const InvalidPasswordFailure([super.errorMessage]);
}

/// 비밀번호 재설정 필요
class NeedRenewPassWordFailure extends Failure {
  const NeedRenewPassWordFailure([super.errorMessage]);
}

/// 존재하지 않는 이메일
class NotFoundEmailFailure extends Failure {
  const NotFoundEmailFailure([super.errorMessage]);
}

class UserAlreadyAppliedFailure extends Failure {
  const UserAlreadyAppliedFailure([super.errorMessage]);
}

/// 인증 필요
class NeedCertificationFailure extends Failure {
  const NeedCertificationFailure([super.errorMessage]);
}

// 인증번호 오류
class InvalidCertificationFailure extends Failure {
  const InvalidCertificationFailure([super.errorMessage]);
}

/// 닉네임 검증 가능 횟수 초과
class NicknameVerificationLimitExceededFailure extends Failure {
  const NicknameVerificationLimitExceededFailure([super.errorMessage]);
}

// 권한이 부여되지 않음
class PermissionNotGrantedFailure extends Failure {
  final dynamic permission;

  const PermissionNotGrantedFailure(
    this.permission, [
    super.errorMessage = 'Permission not granted',
  ]);
}

// 에셋이 없음
class NoAssetFailure extends Failure {
  const NoAssetFailure([super.errorMessage]);
}

// 이미지 디코딩 실패
class ImageDecodeFailure extends Failure {
  const ImageDecodeFailure([super.errorMessage]);
}

// 푸드렌즈 SDK 호출 실패
class FoodLensFailure extends Failure {
  const FoodLensFailure([super.errorMessage]);
}

/// 스토어 앱 버전 가져오기 실패
class GetStoreVersionFailure extends Failure {
  const GetStoreVersionFailure([super.errorMessage]);
}

// 카메라 사용 불가
class NotAvailableCameraFailure extends Failure {
  const NotAvailableCameraFailure([super.errorMessage]);
}

// 센터 입력 체중 삭제 불가
class CantDeleteCenterWeight extends Failure {
  const CantDeleteCenterWeight([super.errorMessage]);
}

// 마지막 체중 삭제 불가
class CantDeleteLastWeight extends Failure {
  const CantDeleteLastWeight([super.errorMessage]);
}

// 삭제하려는 체중 찾을 수 없음
class NotFoundWeightFailure extends Failure {
  const NotFoundWeightFailure([super.errorMessage]);
}

// 강제 업데이트 필요
class NeedForceUpdateFailure extends Failure {
  const NeedForceUpdateFailure([super.errorMessage]);
}

// 수정하려는 체형 사진 찰을 수 없음
class NotFoundBodyImageFailure extends Failure {
  const NotFoundBodyImageFailure([super.errorMessage]);
}

// 식단 즐겨찾기 최대 등록 개수 초과
class FoodBookmarkOverFailure extends Failure {
  const FoodBookmarkOverFailure([super.errorMessage]);
}

// 네트워크 없음
class NetworkFailure extends Failure {
  const NetworkFailure([super.errorMessage]);
}

class MethodChannelFailure extends Failure {
  const MethodChannelFailure([super.errorMessage]);
}

// 이미지 없음
class ImageFailure extends Failure {
  const ImageFailure([super.errorMessage]);
}

// 리포트에 해당하는 유저 없음
class NotFoundReportUserFailure extends Failure {
  const NotFoundReportUserFailure([super.errorMessage]);
}

/// 로딩 중 요청 시 반환
class LoadingFailure extends Failure {
  const LoadingFailure([super.errorMessage]);
}
