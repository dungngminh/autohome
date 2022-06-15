import 'dart:developer';

import 'package:autohome/src/repository/audio_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';

final recorderProvider = AutoDisposeProvider(
  (ref) async {
    final audioRepo = await ref.read(audioRepositoyRef);
    return RecordAudioProvider(
      recorder: Record(),
      audioRepository: audioRepo,
    );
  },
);

class RecordAudioProvider {
  RecordAudioProvider({
    required Record recorder,
    required AudioRepository audioRepository,
  })  : _recorder = recorder,
        _audioRepository = audioRepository {
    record();
  }

  final Record _recorder;
  final AudioRepository _audioRepository;

  Future<void> record() async {
    PermissionStatus micro = await Permission.microphone.request();
    if (micro.isDenied) {
      throw Exception('No have micro permission');
    }
    PermissionStatus storage = await Permission.storage.request();
    if (storage.isDenied) {
      throw Exception('No have storage permission');
    }
    // await Permission.manageExternalStorage.request();
    final dateTimeNow = DateTime.now();
    final fileName = dateTimeNow.millisecondsSinceEpoch.toString();
    String path = (await getTemporaryDirectory()).path;
    if (await _recorder.hasPermission()) {
      await _recorder.start(
        samplingRate: 16000,
        encoder: AudioEncoder.wav,
        path: join(path, '$fileName.wav'),
      );
    } else {}
  }

  Future<void> stopRecorder() async {
    await _recorder.stop().then((url) async {
      final result = await _recorder.isRecording();
      log(result.toString());
      log(url.toString());
      if (url != null) {
        await _audioRepository.sendFileToServer(
          url,
        );
      }
    });
  }
}
