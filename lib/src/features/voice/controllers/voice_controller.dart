import 'dart:developer';

import 'package:autohome/src/features/home_page/controller/action_device_controller.dart';
import 'package:autohome/src/repository/audio_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';

final recorderProvider = Provider(
  (ref) {
    final audioRepo = ref.read(audioRepositoyRef);
    return RecordAudioProvider(
      recorder: Record(),
      audioRepository: audioRepo,
      reader: ref.read,
    );
  },
);

class RecordAudioProvider {
  RecordAudioProvider({
    required Record recorder,
    required AudioRepository audioRepository,
    required Reader reader,
  })  : _recorder = recorder,
        _audioRepository = audioRepository,
        _reader = reader {
    init();
  }

  final Record _recorder;
  final AudioRepository _audioRepository;
  final Reader _reader;

  Future<void> init() async {
    PermissionStatus micro = await Permission.microphone.request();
    if (micro.isDenied) {
      throw Exception('No have micro permission');
    }
    PermissionStatus storage = await Permission.storage.request();
    if (storage.isDenied) {
      throw Exception('No have storage permission');
    }
  }

  Future<void> record() async {
    final dateTimeNow = DateTime.now();
    final fileName = dateTimeNow.millisecondsSinceEpoch.toString();
    String path = (await getTemporaryDirectory()).path;
    if (await _recorder.hasPermission()) {
      await _recorder.start(
        samplingRate: 16000,
        encoder: AudioEncoder.wav,
        path: join(path, '$fileName.wav'),
      );
    }
  }

  Future<void> stopRecorder() async {
    await _recorder.stop().then((url) async {
      log(url.toString());
      if (url != null) {
        final result = await _audioRepository.sendFileToServer(
          url,
        );
        if (result == null) {
          return;
        }
        if (result['path'] == '/led') {
          _reader(actionDeviceProvider).doLedAction(
            nameLed: result['name'],
            status: result['status'] == 'on' ? false : true,
          );
        } else if (result['path'] == '/fan') {
          await _reader(actionDeviceProvider).doFanAction(
            nameFan: result['name'],
            value: result['value'],
          );
        }
      }
    });
  }
}
