
 import 'package:equatable/equatable.dart';

class Failure  extends Equatable{
  final String? message;

  const Failure(this.message);

  @override
  String toString() => message ?? 'Unexpected error';

  List<Object?> get props => [message];
}

class FetchDataException extends Failure {
  const FetchDataException(super.message);
}

class BadRequestException extends Failure {
  const BadRequestException(super.message);
}

class UnauthorizedException extends Failure {
  const UnauthorizedException(super.message);
}

class NotFoundException extends Failure {
  const NotFoundException(super.message);
}

class ConflictException extends Failure {
  const ConflictException(super.message);
}

class InternalServerErrorException extends Failure {
  const InternalServerErrorException(super.message);
}

class NoInternetConnectionException extends Failure {
  const NoInternetConnectionException(super.message);
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure(super.message) ; // Pass null or a default message here
}

class ServerFailure extends Failure {
  const ServerFailure(super.message); // Pass the message here
}

class ReadFileFailure extends Failure {
  const ReadFileFailure(super.message); // Pass the message here
}

class CacheFailure extends Failure {
  const CacheFailure(super.message); // Pass the message here
}