import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final injector = GetIt.instance;

void initDependences() {
  ///Kono Dio Da
  ///
  ///
  var dioOption = BaseOptions(
    baseUrl: "https://98f2-118-68-43-232.ngrok.io",
    receiveTimeout: 3000,
    connectTimeout: 5000,
  );
  Dio dio = Dio(dioOption)
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));
  injector
    ..registerLazySingleton<Dio>(() => dio)
    ..registerFactory;
}
