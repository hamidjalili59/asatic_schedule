import 'dart:io';

import 'package:asatic/features/admin/domain/models/admin.dart';
import 'package:asatic/features/device/domain/models/device.dart';
import 'package:asatic/features/locator.dart';
import 'package:asatic/features/queue/domain/models/queue.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:isar/isar.dart';

bool _isStart = false;
Future<void> init(InternetAddress ip, int port) async {
  await _initializeInjection();
}

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) async {
  return serve(handler, ip, port);
}

Future<void> _initializeInjection() async {
  if (_isStart) {
    return;
  }
  _isStart = true;
  setUp();
  await initDatabase();
}

Future<void> initDatabase() async {
  await Isar.initializeIsarCore(download: true);
  final databases = await Isar.open(
    [
      DeviceSchema,
      QueueModelSchema,
      AdminSchema,
    ],
    directory: './tmp/',
    // inspector: false,
    name: 'databases',
  );

  locator.registerSingleton<Isar>(databases);
}
