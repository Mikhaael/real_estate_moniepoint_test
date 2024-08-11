import 'package:dio/dio.dart';
import 'package:real_estate_moniepoint_test/core/utils/extensions/extensions.dart';

class TimeOutException extends DioException {
  TimeOutException(RequestOptions options, Response? response)
      : super(requestOptions: options, response: response);

  @override
  String toString() {
    return 'Connection timeout';
  }
}

class ConnectionException extends DioException {
  ConnectionException(RequestOptions options, Response? response)
      : super(requestOptions: options);

  @override
  String toString() {
    return 'Connection error! Please check your connection.';
  }
}

class BadRequestException extends DioException {
  BadRequestException(RequestOptions options, Response? response)
      : super(requestOptions: options);

  @override
  String toString() {
    return 'Invalid request ${response?.statusMessage.value}';
  }
}

class BadResponseException extends DioException {
  BadResponseException(RequestOptions options, Response? response)
      : super(requestOptions: options, response: response);

  @override
  String toString() {
    return 'Bad response ${response?.statusMessage.value}';
  }
}

class UnauthorizedException extends DioException {
  UnauthorizedException(RequestOptions options, Response? response)
      : super(requestOptions: options, response: response);

  @override
  String toString() {
    return 'Access denied';
  }
}

class NotFoundException extends DioException {
  NotFoundException(RequestOptions options, Response? response)
      : super(requestOptions: options, response: response);

  @override
  String toString() {
    return 'Requested resource not found';
  }
}

class InternalServerErrorException extends DioException {
  InternalServerErrorException(RequestOptions options, Response response)
      : super(requestOptions: options);

  @override
  String toString() {
    return "Server couldn't process request. Please try again!";
  }
}

class UnknownErrorException extends DioException {
  UnknownErrorException(RequestOptions options, Response? response)
      : super(requestOptions: options);

  @override
  String toString() {
    return 'Unknown error, please try again.';
  }
}
