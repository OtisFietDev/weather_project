import 'package:dartz/dartz.dart';
import 'package:weather_project/core/network/error/failures.dart';
import 'package:weather_project/features/auth/domain/entities/sign_in_entity.dart';
import 'package:weather_project/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> signIn(SignInEntity entity);
}
