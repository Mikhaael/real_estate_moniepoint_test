import 'dart:io';

import 'package:dio/dio.dart';
import 'package:real_estate_moniepoint_test/core/api/exceptions/exceptions.dart';
import 'package:real_estate_moniepoint_test/core/preferences/auth_preference.dart';
import 'package:real_estate_moniepoint_test/core/services/service_locator.dart';

class ApiInterceptor extends Interceptor {
  final Dio dio;
  final Dio tokenDio;

  final AuthPreferences pref;

  ApiInterceptor(this.dio, this.tokenDio) : pref = app<AuthPreferences>();
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        throw (TimeOutException(err.requestOptions, err.response));
      case DioExceptionType.sendTimeout:
        throw (err);
      case DioExceptionType.receiveTimeout:
        throw (err);
      case DioExceptionType.badCertificate:
        throw (err);
      case DioExceptionType.badResponse:
        if (err.response?.statusCode == 401) {
          throw (UnauthorizedException(err.requestOptions, err.response));
        }
        throw (BadResponseException(err.requestOptions, err.response));
      case DioExceptionType.cancel:
        throw (err);
      case DioExceptionType.connectionError:
        throw (err);
      case DioExceptionType.unknown:
        if (err.error is SocketException) {
          throw (ConnectionException(err.requestOptions, err.response));
        }
        throw (UnknownErrorException(err.requestOptions, err.response));
    }
  }
}
