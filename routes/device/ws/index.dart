// routes/ws.dart
import 'dart:convert';

import 'package:asatic/features/device/domain/models/device.dart';
import 'package:asatic/features/locator.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';
import 'package:isar/isar.dart';

Handler get onRequest {
  return webSocketHandler(
    (channel, protocol) {
      // Subscribe to the stream of messages from the client.

      channel.stream.listen(
        (message) {
          channel.sink.add('pong');
          locator
              .get<Isar>()
              .devices
              .watchObject(int.tryParse(message as String) ?? 0)
              .listen((event) {
            channel.sink.add(jsonEncode(event?.toJson()));
          });
          // Send outgoing messages to the connected client.
        },
        // The connection was terminated.
      );
    },
  );
}
