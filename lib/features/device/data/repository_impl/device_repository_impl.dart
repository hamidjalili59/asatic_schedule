import 'dart:async';

import 'package:asatic/features/core/models/base_repository.dart';
import 'package:asatic/features/core/models/returnSaveFuncInfo.dart';
import 'package:asatic/features/device/domain/models/device.dart';
import 'package:asatic/features/locator.dart';
import 'package:isar/isar.dart';

///
/// implement logic of device data here
///
class DeviceRepositoryImpl extends BaseRepository<Device> {
  /// instance of ISAR Database
  @override
  FutureOr<ReturnSaveFuncInfo<Device>> create(Device object) async {
    try {
      final newDevice = Device(
        name: object.name ?? 'UNNAMED',
        message: object.message ?? 'UNKNOWN',
        counterList: object.counterList,
      );

      await locator.get<Isar>().writeTxn(() async {
        await locator.get<Isar>().devices.put(newDevice); // insert & update
      });
      final result = ReturnSaveFuncInfo<Device>()..setValue(newDevice);
      return result;
    } catch (e) {
      final result = ReturnSaveFuncInfo<Device>()..setError();
      return result;
    }
  }

  @override
  FutureOr<ReturnSaveFuncInfo<bool>> deleteById(int id) async {
    final deleteResult = await locator.get<Isar>().devices.delete(id);

    if (deleteResult) {
      final result = ReturnSaveFuncInfo<bool>()..setValue(true);
      return result;
    } else {
      final result = ReturnSaveFuncInfo<bool>()..setError();
      return result;
    }
  }

  @override
  FutureOr<ReturnSaveFuncInfo<List<Device?>>> findAll() async {
    final deviceList = await locator.get<Isar>().devices.getAll(
          List.generate(
            await locator.get<Isar>().devices.count(),
            (index) => index + 1,
          ),
        );
    if (deviceList.isNotEmpty) {
      final result = ReturnSaveFuncInfo<List<Device?>>()..setValue(deviceList);
      return result;
    } else {
      final result = ReturnSaveFuncInfo<List<Device?>>()..setError();
      return result;
    }
  }

  @override
  FutureOr<ReturnSaveFuncInfo<Device>> findById(int id) async {
    final device = await locator.get<Isar>().devices.get(id);
    if (device == null) {
      final result = ReturnSaveFuncInfo<Device>()..setError();
      return result;
    } else {
      final result = ReturnSaveFuncInfo<Device>()..setValue(device);
      return result;
    }
  }

  @override
  FutureOr<ReturnSaveFuncInfo<Device>> updateById(Device object) async {
    final changedDevice = await locator
        .get<Isar>()
        .writeTxn(() => locator.get<Isar>().devices.put(object));
    if (changedDevice == object.id) {
      final result = ReturnSaveFuncInfo<Device>()..setValue(object);
      return result;
    } else {
      final result = ReturnSaveFuncInfo<Device>()..setError();
      return result;
    }
  }
}
