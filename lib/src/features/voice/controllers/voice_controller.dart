import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';

final recorderProvider = AutoDisposeProvider(
  (ref) {
    return RecordAudioProvider(
      recorder: Record(),
    );
  },
);

class RecordAudioProvider {
  RecordAudioProvider({
    required Record recorder,
  }) : _recorder = recorder {
    record();
  }

  final Record _recorder;

  Future<void> record() async {
    String path = (await getTemporaryDirectory()).path;
    if (await _recorder.hasPermission()) {
      await _recorder.start(
        samplingRate: 16000,
        encoder: AudioEncoder.wav,
        path: join(path, 'temp.wav'),
      );
    } else {
      await Permission.microphone.request();
      await Permission.storage.request();
      await Permission.manageExternalStorage.request();
    }
  }

  Future<void> stopRecorder() async {
    final url = await _recorder.stop();
    log(url.toString());
  }
}
