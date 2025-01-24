// core/network/clients/rest_api_clients.dart
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@module
abstract class RestApiClient {
  @singleton
  http.Client get client => http.Client();
}
