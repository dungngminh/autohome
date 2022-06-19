import 'dart:developer';

import 'package:autohome/src/core/utils/app_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final baseApiProvider = ProviderFamily<BaseApi, String>(
  (ref, url) {
    var dioOption = BaseOptions(
      baseUrl: url,
      receiveTimeout: const Duration(minutes: 3).inMilliseconds,
      connectTimeout: const Duration(minutes: 3).inMilliseconds,
    );
    Dio dio = Dio(dioOption)
      ..interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          compact: true,
        ),
      );
    return BaseApi(dio: dio);
  },
  name: 'baseApi',
);

class BaseApi {
  BaseApi({
    required this.dio,
  });

  final Dio dio;

  Future<Response> post({
    required String path,
    required dynamic data,
    bool isFile = false,
  }) async {
    try {
      log('Call');
      return await dio.post(
        path,
        data: data,
        options: isFile
            ? Options(
                contentType: 'multipart/form-data',
              )
            : null,
      );
    } on DioError catch (e) {
      AppUtils.logger(e, location: runtimeType, isError: true);
      rethrow;
    }
  }

  Future<Response> get({
    required String path,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      return await dio.get(path, queryParameters: queryParams);
    } on DioError catch (e) {
      AppUtils.logger(e, location: runtimeType, isError: true);
      rethrow;
    }
  }
}

final httpBaseRef = Provider((ref) {
  return BaseApiHttp();
});

class BaseApiHttp {
  final uri = Uri.https(
    'bbfd-2001-ee0-4b4f-e880-97e2-6817-957d-39c3.ap.ngrok.io',
    'api/v1/transcript',
  );

  Future<String?> post(String filePath) async {
    var request = http.MultipartRequest('POST', uri)
      ..files.add(
        await http.MultipartFile.fromPath(
          'audio',
          filePath,
        ),
      )
      ..headers['Content-Type'] = 'multipart/form-data';
    var response = await request.send();
    if (response.statusCode == 200) {
      print('Uploaded!');
    } else {
      print(response);
      throw Exception('Fail');
    }
    return null;
  }
}
