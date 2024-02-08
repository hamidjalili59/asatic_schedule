import 'dart:async';

import 'package:asatic/features/core/models/base_repository.dart';
import 'package:asatic/features/core/models/returnSaveFuncInfo.dart';
import 'package:asatic/features/counter/domain/models/counter.dart';
import 'package:asatic/features/locator.dart';
import 'package:isar/isar.dart';

///
/// implement logic of device data here
///
class CounterRepositoryImpl extends BaseRepository<Counter> {
  /// instance of ISAR Database
  @override
  FutureOr<ReturnSaveFuncInfo<Counter>> create(Counter object) async {
    try {
      final newCounter = Counter(
        name: object.name ?? 'UNNAMED',
        queueList: object.queueList,
      );

      await locator.get<Isar>().writeTxn(() async {
        await locator.get<Isar>().counters.put(newCounter); // insert & update
      });
      final result = ReturnSaveFuncInfo<Counter>()..setValue(newCounter);
      return result;
    } catch (e) {
      final result = ReturnSaveFuncInfo<Counter>()..setError();
      return result;
    }
  }

  @override
  FutureOr<ReturnSaveFuncInfo<bool>> deleteById(int id) async {
    final deleteResult = await locator.get<Isar>().counters.delete(id);

    if (deleteResult) {
      final result = ReturnSaveFuncInfo<bool>()..setValue(true);
      return result;
    } else {
      final result = ReturnSaveFuncInfo<bool>()..setError();
      return result;
    }
  }

  @override
  FutureOr<ReturnSaveFuncInfo<List<Counter?>>> findAll() async {
    final deviceList = await locator.get<Isar>().counters.getAll(
          List.generate(
            await locator.get<Isar>().counters.count(),
            (index) => index + 1,
          ),
        );
    if (deviceList.isNotEmpty) {
      final result = ReturnSaveFuncInfo<List<Counter?>>()..setValue(deviceList);
      return result;
    } else {
      final result = ReturnSaveFuncInfo<List<Counter?>>()..setError();
      return result;
    }
  }

  @override
  FutureOr<ReturnSaveFuncInfo<Counter>> findById(int id) async {
    final device = await locator.get<Isar>().counters.get(id);
    if (device == null) {
      final result = ReturnSaveFuncInfo<Counter>()..setError();
      return result;
    } else {
      final result = ReturnSaveFuncInfo<Counter>()..setValue(device);
      return result;
    }
  }

  @override
  FutureOr<ReturnSaveFuncInfo<Counter>> updateById(Counter object) async {
    final changedCounter = await locator
        .get<Isar>()
        .writeTxn(() => locator.get<Isar>().counters.put(object));
    if (changedCounter == object.id) {
      final result = ReturnSaveFuncInfo<Counter>()..setValue(object);
      return result;
    } else {
      final result = ReturnSaveFuncInfo<Counter>()..setError();
      return result;
    }
  }
}
