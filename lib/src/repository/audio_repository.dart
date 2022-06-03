
import 'package:autohome/src/datasource/api/base_api.dart';
import 'package:autohome/src/datasource/local/local_directory.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final audioRepositoy = Provider((ref) async {
  final baseApiRef = ref.read(baseApiProvider);
  final localDirectoryRef = await ref.read(localDirectoryProvider);
  return AudioRepository(
    baseApi: baseApiRef,
    localDirectory: localDirectoryRef,
  );
});

class AudioRepository {
  AudioRepository({
    required this.baseApi,
    required this.localDirectory,
  });
  final BaseApi baseApi;
  final LocalDirectory localDirectory;
  Future<void> sendFileToServer(String fileName) async {
    final file = localDirectory.getFileFromTemp(fileName);

    // final response = await baseApi.MultiPartFile
  }
}
