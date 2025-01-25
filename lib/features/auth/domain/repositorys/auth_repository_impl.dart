// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:weather_project/core/network/error/failures.dart';
import 'package:weather_project/features/auth/data/repository/auth_repositories.dart';
import 'package:weather_project/features/auth/domain/entities/sign_in_entity.dart';
import 'package:weather_project/features/auth/domain/entities/user_entity.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final http.Client client;
  // final String baseUrl = 'https://051f-121-157-188-88.ngrok-free.app';
  static final baseUrl = Platform.isAndroid ? 'http://10.0.2.2:8080' : 'http://localhost:8080';

  AuthRepositoryImpl(this.client);

  @override
  Future<Either<Failure, UserEntity>> signIn(SignInEntity entity) async {
    try {
      final response = await client.post(
        Uri.parse('$baseUrl/sign_in'),
        body: json.encode({
          'email': entity.email,
          'password': entity.password,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return Right(UserEntity.fromJson(data));
      }

      final error = json.decode(response.body)['error'];
      return Left(ServerFailure(error));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
