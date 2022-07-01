import 'dart:developer';

import 'package:autohome/src/datasource/api/base_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final audioRepositoyRef = Provider((ref) {
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
  Future<Map<String, dynamic>?> sendFileToServer(String filePath) async {
    final jsonBody = await baseApi.post(filePath);
    log(jsonBody.toString());
    if (jsonBody!['data'] == 'null') {
      return null;
    } else {
      return jsonBody['data'] as Map<String, dynamic>;
    }
  }
}
