class AppException implements Exception {
  final String message;

  AppException(this.message);
}

class ServerException extends AppException {
  ServerException() : super('Server error occurred');
}

class NetworkException extends AppException {
  NetworkException() : super('Network error occurred');
}