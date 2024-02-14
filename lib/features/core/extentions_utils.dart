import 'package:asatic/features/admin/domain/models/admin.dart';
import 'package:asatic/features/admin/domain/models/get_admin_response.dart';
import 'package:asatic/features/counter/domain/models/counter.dart';
import 'package:asatic/features/counter/domain/models/get_counter_response.dart';
import 'package:asatic/features/device/domain/models/device.dart';
import 'package:asatic/features/device/domain/models/get_device_response.dart';
import 'package:asatic/features/locator.dart';
import 'package:asatic/features/queue/domain/models/queue.dart';
import 'package:isar/isar.dart';

///
extension DeviceExtention on Device {
  ///
  Future<DeviceResponse> toDeviceResponse() async {
    final counterModelList =
        await locator.get<Isar>().counters.getAll(counterList ?? []);
    return DeviceResponse(
      id: id,
      name: name,
      message: message,
      counterList: counterModelList,
    );
  }
}

///
extension AdminExtention on Admin {
  ///
  Future<AdminResponse> toAdminResponse() async {
    final deviceModelList =
        await locator.get<Isar>().devices.getAll(deviceList ?? []);
    return AdminResponse(
      name: name,
      address: address,
      password: password,
      phone: phone,
      deviceList: deviceModelList,
      id: id,
    );
  }
}

///
extension CounterExtention on Counter {
  ///
  Future<CounterResponse> toCounterResponse() async {
    final queueModelList =
        await locator.get<Isar>().queueModels.getAll(queueList ?? []);
    return CounterResponse(
      id: id,
      name: name,
      queueList: queueModelList,
    );
  }
}
