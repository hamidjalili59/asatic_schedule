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
    required this.maxRange,
    required this.minRange,
    this.id,
  });

  ///
  factory QueueModel.fromJson(Map<String, dynamic> json) => QueueModel(
        id: json['id'] as Id?,
        name: json['name'] as String?,
        lastTurn: json['lastTurn'] as int?,
        maxRange: json['maxRange'] as int?,
        minRange: json['minRange'] as int?,
      );

  ///
  /// i want to write Id with UUid
  ///
  Id? id = Isar.autoIncrement;

  ///
  /// name of queue
  ///
  String? name;

  ///
  /// name of queue
  ///
  int? minRange;

  ///
  /// name of queue
  ///
  int? maxRange;

  ///
  /// current Turn Count number on hardware
  ///
  int? lastTurn;

  ///
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'lastTurn': lastTurn,
        'maxRange': maxRange,
        'minRange': minRange,
      };
}
