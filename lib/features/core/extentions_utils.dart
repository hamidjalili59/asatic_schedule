import 'package:asatic/features/admin/domain/models/admin.dart';
import 'package:asatic/features/admin/domain/models/get_admin_response.dart';
import 'package:asatic/features/device/domain/models/device.dart';
import 'package:asatic/features/device/domain/models/get_device_response.dart';
import 'package:asatic/features/locator.dart';
import 'package:asatic/features/queue/domain/models/queue.dart';
import 'package:isar/isar.dart';

///
extension DeviceExtention on Device {
  ///
  Future<DeviceResponse> toDeviceResponse() async {
    final queueModelList =
        await locator.get<Isar>().queueModels.getAll(queueList ?? []);
    return DeviceResponse(
      id: id,
      name: name,
      message: message,
      queueList: queueModelList,
    );
  }
}

///
extension AdminExtention on Admin {
  ///
  Future<AdminResponse> toAdminResponse() async {
    final deviceModelList =
        await locator.get<Isar>().devices.getAll(deviceList ?? []);
    final newDeviceModelList = List<DeviceResponse?>.empty(growable: true);
    for (var i = 0; i < deviceModelList.length; i++) {
      newDeviceModelList.add(await deviceModelList[i]?.toDeviceResponse());
    }

    return AdminResponse(
      name: name,
      address: address,
      password: password,
      phone: phone,
      deviceList: newDeviceModelList,
      id: id,
    );
  }
}
