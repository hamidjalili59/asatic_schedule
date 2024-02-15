import 'dart:async';

import 'package:asatic/features/core/models/base_repository.dart';
import 'package:asatic/features/core/models/model_with_parent_id.dart';
import 'package:asatic/features/core/models/returnSaveFuncInfo.dart';
import 'package:asatic/features/device/domain/models/device.dart';
import 'package:asatic/features/locator.dart';
import 'package:asatic/features/queue/domain/models/queue.dart';
import 'package:isar/isar.dart';

///
/// implement logic of device data here
///
class QueueRepositoryImpl
    extends BaseRepository<ModelWithParentId<QueueModel>, QueueModel> {
  /// instance of ISAR Database
  late Isar db = locator.get<Isar>();
  @override
  FutureOr<ReturnSaveFuncInfo<QueueModel>> create(
    ModelWithParentId<QueueModel> object,
  ) async {
    try {
      final newQueueModel = object.data;

      await db.writeTxn(() async {
        final device = await db.devices.get(object.parentId);
        await db.queueModels.put(newQueueModel).then((value) async {
          final queueList = device?.queueList?.toList();
          queueList?.add(value);
          device?.queueList = queueList;
        });
        await db.devices.put(
          device ??
              Device(
                id: object.parentId,
                message: device?.message,
                name: device?.name,
                queueList: device?.queueList,
              ),
        );
      });
      final result = ReturnSaveFuncInfo<QueueModel>()..setValue(newQueueModel);
      return result;
    } catch (e) {
      final result = ReturnSaveFuncInfo<QueueModel>()..setError();
      return result;
    }
  }

  @override
  FutureOr<ReturnSaveFuncInfo<bool>> deleteById(int id) async {
    final deleteResult = await db.queueModels.delete(id);

    if (deleteResult) {
      final result = ReturnSaveFuncInfo<bool>()..setValue(true);
      return result;
    } else {
      final result = ReturnSaveFuncInfo<bool>()..setError();
      return result;
    }
  }

  @override
  FutureOr<ReturnSaveFuncInfo<List<QueueModel?>>> findAll() async {
    final deviceList = await db.queueModels.getAll(
      List.generate(await db.queueModels.count(), (index) => index + 1),
    );
    if (deviceList.isNotEmpty) {
      final result = ReturnSaveFuncInfo<List<QueueModel?>>()
        ..setValue(deviceList);
      return result;
    } else {
      final result = ReturnSaveFuncInfo<List<QueueModel?>>()..setError();
      return result;
    }
  }

  @override
  FutureOr<ReturnSaveFuncInfo<QueueModel>> findById(int id) async {
    final device = await db.queueModels.get(id);
    if (device == null) {
      final result = ReturnSaveFuncInfo<QueueModel>()..setError();
      return result;
    } else {
      final result = ReturnSaveFuncInfo<QueueModel>()..setValue(device);
      return result;
    }
  }

  @override
  FutureOr<ReturnSaveFuncInfo<QueueModel>> updateById(
    ModelWithParentId<QueueModel> object,
  ) async {
    final changedQueueModel =
        await db.writeTxn(() => db.queueModels.put(object.data));
    if (changedQueueModel == object.data.id) {
      final result = ReturnSaveFuncInfo<QueueModel>()..setValue(object.data);
      return result;
    } else {
      final result = ReturnSaveFuncInfo<QueueModel>()..setError();
      return result;
    }
  }
}
