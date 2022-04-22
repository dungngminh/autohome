import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/io.dart';

final webSockerProvider = AutoDisposeProvider<IOWebSocketChannel>((ref) {
  final channel =
      IOWebSocketChannel.connect("ws://0.tcp.ngrok.io:15384/basehub");
  return channel;
});
