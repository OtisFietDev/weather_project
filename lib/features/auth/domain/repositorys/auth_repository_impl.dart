// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:weather_project/core/network/error/failures.dart';
import 'package:weather_project/features/auth/data/repository/auth_repositories.dart';
import 'package:weather_project/features/auth/domain/entities/user_entity.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final http.Client client;
  final String baseUrl = 'https://051f-121-157-188-88.ngrok-free.app';

  AuthRepositoryImpl(this.client);

  @override
  Future<Either<Failure, UserEntity>> signIn(String email, String password) async {
    try {
      final response = await client.post(
        Uri.parse('$baseUrl/sign_in'),
        body: json.encode({
          'email': email,
          'password': password,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return Right(UserEntity(id: data['id'], email: data['email'], name: data['name']));
      }

      final error = json.decode(response.body)['error'];
      return Left(ServerFailure(error));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
