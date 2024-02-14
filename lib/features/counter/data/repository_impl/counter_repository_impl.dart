import 'dart:async';

import 'package:asatic/features/core/extentions_utils.dart';
import 'package:asatic/features/core/models/base_repository.dart';
import 'package:asatic/features/core/models/model_with_parent_id.dart';
import 'package:asatic/features/core/models/returnSaveFuncInfo.dart';
import 'package:asatic/features/counter/domain/models/counter.dart';
import 'package:asatic/features/counter/domain/models/get_counter_response.dart';
import 'package:asatic/features/device/domain/models/device.dart';
import 'package:asatic/features/locator.dart';
import 'package:isar/isar.dart';

///
/// implement logic of device data here
///
class CounterRepositoryImpl
    extends BaseRepository<ModelWithParentId<Counter>, CounterResponse> {
  /// instance of ISAR Database
  late Isar db = locator.get<Isar>();
  @override
  FutureOr<ReturnSaveFuncInfo<CounterResponse>> create(
    ModelWithParentId<Counter> object,
  ) async {
    try {
      final newCounter = object.data;

      await db.writeTxn(() async {
        final device = await db.devices.get(object.parentId);
        await db.counters.put(newCounter).then((value) async {
          final counterList = device?.counterList?.toList();
          counterList?.add(value);
          device?.counterList = counterList;
        }); // insert & update
        await db.devices.put(
          device ??
              Device(
                id: object.parentId,
                counterList: device?.counterList,
                name: device?.name ?? 'Device',
                message: device?.message ?? 'message device',
              ),
        );
      });
      final result = ReturnSaveFuncInfo<CounterResponse>()
        ..setValue(await newCounter.toCounterResponse());
      return result;
    } catch (e) {
      final result = ReturnSaveFuncInfo<CounterResponse>()..setError();
      return result;
    }
  }

  @override
  FutureOr<ReturnSaveFuncInfo<bool>> deleteById(int id) async {
    final deleteResult = await db.counters.delete(id);

    if (deleteResult) {
      final result = ReturnSaveFuncInfo<bool>()..setValue(true);
      return result;
    } else {
      final result = ReturnSaveFuncInfo<bool>()..setError();
      return result;
    }
  }

  @override
  FutureOr<ReturnSaveFuncInfo<List<CounterResponse?>>> findAll() async {
    final counterList = await db.counters.getAll(
      List.generate(await db.counters.count(), (index) => index + 1),
    );
    final responseCounter = List<CounterResponse?>.empty(growable: true);
    for (final element in counterList) {
      responseCounter.add(await element?.toCounterResponse());
    }
    if (counterList.isNotEmpty) {
      final result = ReturnSaveFuncInfo<List<CounterResponse?>>()
        ..setValue(responseCounter);
      return result;
    } else {
      final result = ReturnSaveFuncInfo<List<CounterResponse?>>()..setError();
      return result;
    }
  }

  @override
  FutureOr<ReturnSaveFuncInfo<CounterResponse>> findById(int id) async {
    final counter = await db.counters.get(id);
    if (counter == null) {
      final result = ReturnSaveFuncInfo<CounterResponse>()..setError();
      return result;
    } else {
      final result = ReturnSaveFuncInfo<CounterResponse>()
        ..setValue(await counter.toCounterResponse());
      return result;
    }
  }

  @override
  FutureOr<ReturnSaveFuncInfo<CounterResponse>> updateById(
    ModelWithParentId<Counter> object,
  ) async {
    final changedCounter =
        await db.writeTxn(() async => db.counters.put(object.data));
    if (changedCounter == object.data.id) {
      final result = ReturnSaveFuncInfo<CounterResponse>()
        ..setValue(await object.data.toCounterResponse());
      return result;
    } else {
      final result = ReturnSaveFuncInfo<CounterResponse>()..setError();
      return result;
    }
  }
}
