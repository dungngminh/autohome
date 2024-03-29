import 'package:autohome/src/app.dart';
import 'package:autohome/src/core/utils/riverpod_logger.dart';
// import 'package:autohome/src/di/injector.dart';
// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  // initDependences();
  // runApp(
  //   DevicePreview(
  //     enabled: Platform.isWindows,
  //     builder: (context) => ProviderScope(
  //       observers: [
  //         RiverpodLogger(),
  //       ],
  //       child: const App(),
  //     ), // Wrap your app
  //   ),
  // );

  runApp(
    ProviderScope(
      observers: [
        RiverpodLogger(),
      ],
      child: const App(),
    ),
  );
}
