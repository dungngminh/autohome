import 'dart:developer';

import 'package:autohome/src/core/utils/app_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final baseApiProvider = Provider<BaseApi>((ref) {
  var dioOption = BaseOptions(
    baseUrl: "http://2.tcp.ngrok.io:12196",
    receiveTimeout: const Duration(minutes: 3).inMilliseconds,
    connectTimeout: const Duration(minutes: 3).inMilliseconds,
  );
  Dio dio = Dio(dioOption)
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));
  return BaseApi(dio: dio);
}, name: "baseApi");

class BaseApi {
  final Dio dio;

  BaseApi({
    required this.dio,
  });

  Future<Response> post({required String path, required dynamic data}) async {
    try {
      log("Call");
      return await dio.post(path, data: data);
    } on DioError catch (e) {
      AppUtils.logger(e, location: runtimeType, isError: true);
      rethrow;
    }
  }

  Future<Response> get(
      {required String path, Map<String, dynamic>? queryParams}) async {
    try {
      return await dio.get(path, queryParameters: queryParams);
    } on DioError catch (e) {
      AppUtils.logger(e, location: runtimeType, isError: true);
      rethrow;
    }
  }
}
