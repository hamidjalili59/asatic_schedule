import 'package:asatic/features/device/domain/models/device.dart';
import 'package:isar/isar.dart';

///
class AdminResponse {
  ///
  /// we use this model in List Usually
  ///
  AdminResponse({
    required this.name,
    required this.address,
    required this.password,
    required this.phone,
    required this.deviceList,
    this.id,
  });

  ///
  /// i want to write Id with UUid
  ///
  final int? id;

  ///
  /// name of admin
  ///
  final String? name;

  ///
  /// name of admin
  ///
  final short? phone;

  ///
  /// name of admin
  ///
  final String? password;

  ///
  /// address is a Text for store shop address
  ///
  final String? address;

  ///
  ///
  ///
  final List<Device?> deviceList; // cannot be nullable

  ///
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'phone': phone,
      'password': password,
      'deviceList': deviceList,
    };
  }
}
