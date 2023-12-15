import 'package:chat_app/core/api/api_consumer.dart';
import 'package:chat_app/core/api/api_interceptor.dart';
import 'package:chat_app/core/api/status_code.dart';
import 'package:chat_app/core/di/di.dart';
import 'package:chat_app/core/error_handler/failure.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as: ApiConsumer)
class DioConsumer implements ApiConsumer {
  final Dio client;

  DioConsumer({required this.client}) {
    client.options
      ..followRedirects = false
      ..receiveDataWhenStatusError = true
      ..responseType = ResponseType.json;
    // ..validateStatus = (status) => status! < StatusCode.internalServerError;
    client.interceptors.add(di<AppInterceptors>());
    if (kDebugMode) {
      client.interceptors.add(
        LogInterceptor(requestBody: true, responseBody: true),
      );
    }
  }

  @override
  Future get({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    // try {
    client.options.headers = headers;
    final response = await client.get(path, queryParameters: queryParameters);
    return handelResponseAsJson(response);
    // } on DioException catch (error) {
    //   handleDioError(error);
    // }
  }

  @override
  Future<Map<String, dynamic>> post({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    client.options.headers = headers;
    final response =
        await client.post(path, queryParameters: queryParameters, data: body);
    return handelResponseAsJson(response);
  }

  @override
  Future put({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    // try {
    client.options.headers = headers;

    final response =
        await client.put(path, queryParameters: queryParameters, data: body);
    return handelResponseAsJson(response);
    // } on DioException catch (error) {
    //   handleDioError(error);
    // }
  }
}

Map<String, dynamic> handelResponseAsJson(Response<dynamic> response) {
  return response.data as Map<String, dynamic>;
}

class DioHandlerExc implements Exception {
  Failure? failure;

  DioHandlerExc.handle(dynamic error) {
    if (error is DioException) {
      failure = _handleError(error);
    } else {
      failure = const Failure("something wrong");
    }
  }
}

Failure? _handleError(DioException exception) {
  switch (exception.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.badResponse:
      final statusCode = exception.response?.statusCode;

      debugPrint('Status Code: $statusCode');
      switch (statusCode) {
        case StatusCode.badRequest:
        case StatusCode.unauthorized:
        case StatusCode.forbidden:
          debugPrint(
            'The excption Is ${exception.response?.data['message'] as String}',
          );
          debugPrint('The excption Is ${exception.response?.statusCode}');
          debugPrint('The excption Is ${exception.response?.statusMessage}');
          return Failure(
            exception.response?.data['message'] as String,
          );
        case StatusCode.notFound:
          return const Failure('Kota');
        case StatusCode.confilct:
          return const Failure('Kota');

        case StatusCode.internalServerError:
          return const Failure('Kota');
      }
    case DioExceptionType.cancel:
      break;
    case DioExceptionType.unknown:
      return const Failure('Kota');
    case DioExceptionType.badCertificate:
    // TODO: Handle this case.
    case DioExceptionType.connectionError:
    // TODO: Handle this case.
  }
  return null;
}