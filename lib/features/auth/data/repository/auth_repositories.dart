import 'package:dartz/dartz.dart';
import 'package:weather_project/core/network/error/failures.dart';
import 'package:weather_project/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> signIn(String email, String password);
}
