import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_project/core/network/error/failures.dart';
import 'package:weather_project/features/auth/data/repository/auth_repositories.dart';
import 'package:weather_project/features/auth/domain/entities/user_entity.dart';

@lazySingleton
class SignInUseCase {
  final AuthRepository repository;

  SignInUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call(String email, String password) async {
    return await repository.signIn(email, password);
  }
}
