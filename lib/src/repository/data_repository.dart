import 'package:autohome/src/datasource/api/base_api.dart';
import 'package:autohome/src/model/device.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dataRepositoryProvider = Provider<DataRepository>((ref) {
  return DataRepository(baseApi: ref.watch(baseApiProvider));
});

class DataRepository {
  final BaseApi baseApi;

  DataRepository({required this.baseApi});

  Future<List<Device>> getDeviceData() async {
    try {
      final response = await baseApi.get(path: "/device");
      return (response.data as List<dynamic>)
          .map((e) => Device.fromJson(e))
          .toList();
    } catch (e) {
      throw Exception();
    }
  }

  Future<String> doDeviceAction(
      {required String deviceType,
      required String name,
      required String action}) async {
    try {
      final response =
          await baseApi.get(path: "/$deviceType", queryParams: <String, String>{
        "ledname": name,
        "ledstatus": action,
      });
      return response.data;
    } catch (e) {
      throw Exception();
    }
  }
}
