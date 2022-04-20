import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/io.dart';

final webSockerProvider = AutoDisposeProvider<IOWebSocketChannel>((ref) {
  final channel =
      IOWebSocketChannel.connect("ws://4.tcp.ngrok.io:19914/basehub");
  return channel;
});
