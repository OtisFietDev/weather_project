class GeneralException implements Exception {
  final String message;
  final String? code;

  GeneralException(this.message, [this.code]);
}

/// Exception occur when server failure
class ServerException implements Exception {
  final String message;
  final int? statusCode;

  ServerException(this.message, [this.statusCode]);
}

/// Exception occur when call api over on time
class CancelTokenException implements Exception {
  final String message;
  final int? statusCode;

  CancelTokenException(this.message, [this.statusCode]);
}

/// Exception occur when user canceled
class UserCanceledException implements Exception {
  final String message;
  final int? statusCode;

  UserCanceledException(this.message, [this.statusCode]);
}

class InternalServerError implements Exception {
  final String message = 'Internal Server Error';
}

class ServiceMaintenanceException implements Exception {
  ServiceMaintenanceException(this.message);

  final String message;
}
