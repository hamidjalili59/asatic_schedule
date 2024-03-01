import 'dart:async';

import 'package:asatic/features/admin/domain/models/admin.dart';
import 'package:asatic/features/core/extentions_utils.dart';
import 'package:asatic/features/core/models/base_repository.dart';
import 'package:asatic/features/core/models/model_with_parent_id.dart';
import 'package:asatic/features/core/models/returnSaveFuncInfo.dart';
import 'package:asatic/features/device/domain/models/device.dart';
import 'package:asatic/features/device/domain/models/get_device_response.dart';
import 'package:asatic/features/locator.dart';
import 'package:isar/isar.dart';

///
/// implement logic of device data here
///
class DeviceRepositoryImpl
    extends BaseRepository<ModelWithParentId<Device>, DeviceResponse> {
  /// instance of ISAR Database
  late Isar db = locator.get<Isar>();

  @override
  FutureOr<ReturnSaveFuncInfo<DeviceResponse>> create(
    ModelWithParentId<Device> object,
  ) async {
    try {
      final newDevice = object.data;

      await db.writeTxn(
        () async {
          final admin = await db.admins.get(object.parentId);
          await db.devices.put(newDevice).then((value) async {
            final deviceList = admin?.deviceList?.toList();
            deviceList?.add(value);
            admin?.deviceList = deviceList;
          }); // insert & update
          await db.admins.put(
            admin ??
                Admin(
                  // id: object.parentId,
                  deviceList: admin?.deviceList,
                  name: admin?.name,
                  address: admin?.address,
                  password: admin?.password,
                  phone: admin?.phone,
                ),
          );
        }, // insert & update
      );

      final result = ReturnSaveFuncInfo<DeviceResponse>()
        ..setValue(await newDevice.toDeviceResponse());
      return result;
    } catch (e) {
      final result = ReturnSaveFuncInfo<DeviceResponse>()..setError();
      return result;
    }
  }

  @override
  FutureOr<ReturnSaveFuncInfo<bool>> deleteById(int id) async {
    final deleteResult = await db.devices.delete(id);

    if (deleteResult) {
      final result = ReturnSaveFuncInfo<bool>()..setValue(true);
      return result;
    } else {
      final result = ReturnSaveFuncInfo<bool>()..setError();
      return result;
    }
  }

  @override
  FutureOr<ReturnSaveFuncInfo<List<DeviceResponse?>>> findAll() async {
    final deviceList = await db.devices.getAll(
      List.generate(await db.devices.count(), (index) => index + 1),
    );
    final responseDevices = List<DeviceResponse?>.empty(growable: true);
    for (final element in deviceList) {
      responseDevices.add(await element?.toDeviceResponse());
    }

    if (deviceList.isNotEmpty) {
      final result = ReturnSaveFuncInfo<List<DeviceResponse?>>()
        ..setValue(responseDevices);
      return result;
    } else {
      final result = ReturnSaveFuncInfo<List<DeviceResponse?>>()..setError();
      return result;
    }
  }

  @override
  FutureOr<ReturnSaveFuncInfo<DeviceResponse>> findById(int id) async {
    final device = await db.devices.get(id);

    if (device == null) {
      final result = ReturnSaveFuncInfo<DeviceResponse>()..setError();
      return result;
    } else {
      final result = ReturnSaveFuncInfo<DeviceResponse>()
        ..setValue(await device.toDeviceResponse());
      return result;
    }
  }

  @override
  FutureOr<ReturnSaveFuncInfo<DeviceResponse>> updateById(
    ModelWithParentId<Device> object,
  ) async {
    final changedDevice =
        await db.writeTxn(() async => db.devices.put(object.data));
    if (changedDevice == object.data.id) {
      final result = ReturnSaveFuncInfo<DeviceResponse>()
        ..setValue(await object.data.toDeviceResponse());
      return result;
    } else {
      final result = ReturnSaveFuncInfo<DeviceResponse>()..setError();
      return result;
    }
  }
}
