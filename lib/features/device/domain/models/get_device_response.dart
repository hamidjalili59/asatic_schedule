import 'package:asatic/features/counter/domain/models/counter.dart';

///
class DeviceResponse {
  ///
  DeviceResponse({
    required this.id,
    required this.name,
    required this.message,
    required this.counterList,
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
  final List<Counter?>? counterList; // cannot be nullable

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
