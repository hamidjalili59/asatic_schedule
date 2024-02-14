import 'package:asatic/features/queue/domain/models/queue.dart';

///
class CounterResponse {
  ///
  CounterResponse({
    required this.id,
    required this.name,
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
  ///
  ///
  final List<QueueModel?> queueList; // cannot be nullable

  ///
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'queueList': queueList,
    };
  }
}
