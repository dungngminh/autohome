import 'package:autohome/src/features/voice/controllers/voice_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VoiceDialog extends ConsumerWidget {
  const VoiceDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Đang nhận giọng nói',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          ElevatedButton(
            onPressed: () async {
              final provider = await ref.read(recorderProvider);
              await provider.stopRecorder().then((_) {
                Navigator.pop(context);
              });
            },
            child: const Text('Dừng'),
          )
        ],
      ),
    );
  }
}
