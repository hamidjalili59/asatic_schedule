import 'package:asatic/features/queue/domain/models/queue.dart';

///
class DeviceResponse {
  ///
  DeviceResponse({
    required this.id,
    required this.name,
    required this.message,
    required this.queueList,
  });

  ///
  /// i want to write Id with UUid
  ///
  final int? id;

  ///
  /// name of device
  ///
  final String? name;

  ///
  /// this message printed by hardware
  ///
  final String? message;

  ///
  ///
  ///
  final List<QueueModel?>? queueList; // cannot be nullable

  ///
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'message': message,
      'queueList': queueList,
    };
  }
}
