class ServerException implements Exception {
  final String message;
  ServerException(this.message);
}

abstract class Failure{
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
}
