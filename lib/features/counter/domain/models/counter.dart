import 'package:isar/isar.dart';

part 'counter.g.dart';

///
/// we create this model for pulling and pushing
/// device information for devices and databases
///
@collection
class Counter {
  ///
  /// we use this model in List Usually
  ///
  Counter({
    required this.name,
    this.queueList,
    this.id,
  });

  ///
  factory Counter.fromJson(Map<String, dynamic> json) {
    return Counter(
      id: json['id'] as Id?,
      name: json['name'] as String?,
      queueList: json['queueList'] as List<int>?,
    );
  }

  ///
  /// i want to write Id with UUid
  ///
  Id? id = Isar.autoIncrement;

  ///
  /// name of device
  ///
  String? name;

  ///
  ///
  ///
  List<int>? queueList; // cannot be nullable

  ///
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'queueList': queueList,
    };
  }
}
