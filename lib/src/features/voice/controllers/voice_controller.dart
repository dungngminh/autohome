import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sound/flutter_sound.dart';

final recorderProvider = AutoDisposeProvider(
  (ref) {
    return RecordAudioProvider(recorder: FlutterSoundRecorder());
  },
);

class RecordAudioProvider {
  RecordAudioProvider({
    required FlutterSoundRecorder recorder,
  }) : _recorder = recorder {
    _recorder.openRecorder().then((value) {
      isRecordReady = true;
    });
  }

  late final FlutterSoundRecorder _recorder;
  bool isRecordReady = false;
  static const fileName = 'temp.wav';

  Future<void> record() async {
    // PermissionStatus status = await Permission.microphone.request();
    // if (status != PermissionStatus.granted) {
    //   throw RecordingPermissionException('Microphone permission not granted');
    // }
    await _recorder.startRecorder(
      toFile: fileName,
      codec: Codec.pcm16WAV,
      numChannels: 1,
      sampleRate: 16000,
    );
  }

  Future<void> stopRecorder() async {
    await _recorder.stopRecorder();
  }
}
