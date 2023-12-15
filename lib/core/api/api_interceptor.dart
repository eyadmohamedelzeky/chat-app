import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class AppInterceptors extends Interceptor {
  // final cachedAppApiKey = di<SharedPreferences>().getString(
  //   CacheString.authToken,
  // );

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');

    // final cachedAppApiKey =
    //     di<SharedPreferences>().getString(CacheString.authToken);

    // debugPrint('The Cache Token Is $cachedAppApiKey');

    // final headers = {
    //   AppApi.acceptHeaders: AppApi.applicationJsonHeaders,
    //   AppApi.contentTypeHeaders: AppApi.applicationJsonHeaders,
    //   AppApi.parseAppIdKey: AppApi.parseAppIdValue,
    //   AppApi.parseMasterKey: AppApi.parseMasterKeyValue,
    //   if (cachedAppApiKey != null && cachedAppApiKey.isNotEmpty)
    //     'authToken': cachedAppApiKey,
    //   // Add the token as an Authorization header
    // };

    //options.headers.addAll(headers);

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    debugPrint(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    // if (err.response?.statusCode == StatusCode.unauthorized &&
    //     err.response?.statusCode == StatusCode.forbidden) {
    //   // final removeCachedAppApiKey = di<SharedPreferences>().remove(
    //   //   CacheString.authToken,
    //   // );
    //   // navigationKey.currentContext?.go(AppRoutesNames.loginScreen);
    //   // return removeCachedAppApiKey;
    // }
    super.onError(err, handler);
  }
}