import 'dart:developer';
import 'dart:math' hide log;

import 'package:dio/dio.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:restaurants/constants/constants.dart';

BaseOptions _baseOptions = BaseOptions(
  connectTimeout: 5000,
  receiveTimeout: 5000,
  sendTimeout: 5000,
  responseType: ResponseType.json,
  validateStatus: (statusCode) {
    if (statusCode == null) {
      return false;
    }
    if (statusCode == 422) {
      return true;
    } else {
      return statusCode >= 200 && statusCode < 500;
    }
  },
);

InterceptorsWrapper _interceptorsWrapper = InterceptorsWrapper(
  onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
    log('onRequest: ${options.method} ${options.path}, ${options.data}');

    return handler.next(options);
  },
  onResponse: (Response response, ResponseInterceptorHandler handler) {
    log('onResponse: ${response.statusCode} ${response.statusMessage}');

    return handler.next(response);
  },
  onError: (DioError error, ErrorInterceptorHandler handler) {
    log('onError: ${error.response?.statusCode} ${error.response?.data['error'].toString()}');

    return handler.next(error);
  },
);

/// Provides client for API, based on dio.
///
/// It uses [_baseOptions] and [_interceptorsWrapper] as base options.
class ClientApi {
  static Dio createDio({String baseUrl = ApiConstants.baseUrl}) {
    BaseOptions options = _baseOptions.copyWith(baseUrl: baseUrl);

    final Dio dio = Dio(options);

    return dio;
  }

  static Dio createDioWithInterceptors({
    String baseUrl = ApiConstants.baseUrl,
    InterceptorsWrapper? interceptorsWrapper,
  }) {
    log('creating dio with base url: $baseUrl');
    InterceptorsWrapper interceptors =
        interceptorsWrapper ?? _interceptorsWrapper;

    final Dio dio = ClientApi.createDio(baseUrl: baseUrl);

    return dio..interceptors.add(interceptors);
  }

  /// Simple getters for dio with manual configuration. For simple usage.
  static Dio get dio => createDio();

  static Dio get dioWithInterceptors => createDioWithInterceptors();

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async =>
      dioWithInterceptors.get(
        path,
        queryParameters: queryParameters,
      );

  Future<Response<Map<String, dynamic>>> post(
    String path, {
    required dynamic data,
  }) async {
    final response =
        await dioWithInterceptors.post<Map<String, dynamic>>(path, data: data);

    return response;
  }
}
