import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_project/core/network/error/failures.dart';
import 'package:weather_project/features/auth/data/repository/auth_repositories.dart';
import 'package:weather_project/features/auth/domain/entities/sign_in_entity.dart';
import 'package:weather_project/features/auth/domain/entities/user_entity.dart';

@lazySingleton
class SignInUseCase {
  final AuthRepository repository;

  SignInUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call(SignInEntity entity) async {
    return await repository.signIn(entity);
  }
}
