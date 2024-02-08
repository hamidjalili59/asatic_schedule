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
    this.counterList,
    this.id,
  });

  ///
  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      id: json['id'] as Id?,
      name: json['name'] as String?,
      message: json['message'] as String?,
      counterList: json['counterList'] as List<int>?,
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
  List<int>? counterList; // cannot be nullable

  ///
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'message': message,
      'counterList': counterList,
    };
  }
}
