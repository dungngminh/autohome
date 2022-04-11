import 'dart:convert';
import 'dart:developer';

import 'package:autohome/src/datasource/socket/channel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final socketProvider = AutoDisposeStreamProvider((ref) {
  final channelProvider = ref
      .watch(webSockerProvider)
      .stream
      .asBroadcastStream(onCancel: (sub) => sub.cancel());

  var isSubControlError = false;

  ref.watch(webSockerProvider).sink.add(
      jsonEncode(<String, String>{"group": "group_dht11", "status": "join"}));
  final sub = channelProvider.listen(
    (data) {
    },
    onError: (_, stack) {
      print("error");
    },
    onDone: () async {
      log("on done");
      isSubControlError = true;
      await Future.delayed(const Duration(seconds: 10));
      ref.container.refresh(webSockerProvider);
    },
  );

  ref.onDispose(() {
    sub.cancel();
    if (isSubControlError == false) {
      ref.watch(webSockerProvider).sink.close(1001);
    }
  });

  return channelProvider;
});
