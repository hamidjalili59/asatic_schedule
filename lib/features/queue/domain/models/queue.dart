import 'package:isar/isar.dart';

part 'queue.g.dart';

///
/// we create this model for pulling and pushing
/// queue information for queues and databases
///
@collection
class QueueModel {
  ///
  /// we use this model in List Usually
  ///
  QueueModel({
    required this.name,
    required this.lastTurn,
    this.id,
  });

  ///
  factory QueueModel.fromJson(Map<String, dynamic> json) {
    return QueueModel(
      id: json['id'] as Id?,
      name: json['name'] as String?,
      lastTurn: json['lastTurn'] as byte,
    );
  }

  ///
  /// i want to write Id with UUid
  ///
  Id? id = Isar.autoIncrement;

  ///
  /// name of queue
  ///
  String? name;

  ///
  /// current Turn Count number on hardware
  ///
  byte lastTurn;

  ///
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
