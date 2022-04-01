import 'package:autohome/src/app.dart';
import 'package:autohome/src/di/injector.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  initDependences();
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const App(), // Wrap your app
  ));
  // runApp(const App());
}
