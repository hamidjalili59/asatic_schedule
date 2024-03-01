import 'package:isar/isar.dart';

part 'admin.g.dart';

///
/// we create this model for pulling and pushing
/// admin information for admins and databases
///
@collection
class Admin {
  ///
  /// we use this model in List Usually
  ///
  Admin({
    required this.name,
    required this.address,
    required this.password,
    required this.phone,
    // this.id,
    this.deviceList,
  });

  ///
  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      // id: json['id'] as Id?,
      phone: json['phone'] as Id?,
      name: json['name'] as String?,
      password: json['password'] as String?,
      address: json['address'] as String?,
      deviceList: json['deviceList'] != null
          ? (json['deviceList'] as List<dynamic>).map((e) => e as int).toList()
          : null,
    );
  }

  ///
  /// i want to write Id with UUid
  ///
  Id? phone;

  ///
  /// name of admin
  ///
  String? name;

  // ///
  // /// name of admin
  // ///
  // int? phone;

  ///
  /// name of admin
  ///
  String? password;

  ///
  /// address is a Text for store shop address
  ///
  String? address;

  ///
  ///
  ///
  List<int>? deviceList; // cannot be nullable

  ///
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'phone': phone,
      'password': password,
      'deviceList': deviceList,
    };
  }
}
