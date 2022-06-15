import 'package:autohome/src/datasource/api/base_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final audioRepositoyRef = Provider((ref) async {
  final baseApiRef = ref.read(
    httpBaseRef,
  );

  return AudioRepository(
    baseApi: baseApiRef,
  );
});

class AudioRepository {
  AudioRepository({
    required this.baseApi,
  });

  final BaseApiHttp baseApi;
  Future<void> sendFileToServer(String filePath) async {
    baseApi.post(filePath);
    // log(filePath);
    // String fileName = filePath.split('/').last;
    // log(fileName);
    // var formData = FormData.fromMap({
    //   'audio': await MultipartFile.fromFile(filePath, filename: fileName),
    // });

    // log(formData.toString());
    // final response = await baseApi.dio.post(
    //   'https://bbfd-2001-ee0-4b4f-e880-97e2-6817-957d-39c3.ap.ngrok.io/api/v1/transcript',
    //   data: formData,
    //   options: Options(contentType: 'multipart/form-data'),
    // );
    // log(response.toString());
  }
}
