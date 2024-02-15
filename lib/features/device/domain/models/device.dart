import 'package:isar/isar.dart';

part 'device.g.dart';

///
/// we create this model for pulling and pushing
/// device information for devices and databases
///
@collection
class Device {
  ///
  /// we use this model in List Usually
  ///
  Device({
    required this.name,
    required this.message,
    this.queueList,
    this.id,
  });

  ///
  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      id: json['id'] as Id?,
      name: json['name'] as String?,
      message: json['message'] as String?,
      queueList: json['queueList'] != null
          ? (json['queueList'] as List<dynamic>).map((e) => e as int).toList()
          : null,
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
  /// this message printed by hardware
  ///
  String? message;

  ///
  ///
  ///
  List<int>? queueList; // cannot be nullable

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
