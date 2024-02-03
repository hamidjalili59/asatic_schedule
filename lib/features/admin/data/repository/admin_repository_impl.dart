import 'dart:async';

import 'package:asatic/features/admin/domain/models/admin.dart';
import 'package:asatic/features/core/models/base_repository.dart';
import 'package:asatic/features/core/models/returnSaveFuncInfo.dart';
import 'package:asatic/features/locator.dart';
import 'package:isar/isar.dart';

///
/// implement logic of device data here
///
class AdminRepositoryImpl extends BaseRepository<Admin> {
  /// instance of ISAR Database
  late Isar db = locator.get<Isar>();
  @override
  FutureOr<ReturnSaveFuncInfo<Admin>> create(Admin object) async {
    try {
      final newAdmin = Admin(
        name: object.name ?? 'UNNAMED',
        address: object.address ?? 'UNTAGGED',
        message: object.message ?? 'UNKNOWN',
        password: object.password ?? 'UNKNOWN',
        phone: object.phone ?? 0,
      );

      await db.writeTxn(() async {
        await db.admins.put(newAdmin); // insert & update
      });
      final result = ReturnSaveFuncInfo<Admin>()..setValue(newAdmin);
      return result;
    } catch (e) {
      final result = ReturnSaveFuncInfo<Admin>()..setError();
      return result;
    }
  }

  @override
  FutureOr<ReturnSaveFuncInfo<bool>> deleteById(int id) async {
    final deleteResult = await db.admins.delete(id);

    if (deleteResult) {
      final result = ReturnSaveFuncInfo<bool>()..setValue(true);
      return result;
    } else {
      final result = ReturnSaveFuncInfo<bool>()..setError();
      return result;
    }
  }

  @override
  FutureOr<ReturnSaveFuncInfo<List<Admin?>>> findAll() async {
    final deviceList = await db.admins.getAll(
      List.generate(await db.admins.count(), (index) => index + 1),
    );
    if (deviceList.isNotEmpty) {
      final result = ReturnSaveFuncInfo<List<Admin?>>()..setValue(deviceList);
      return result;
    } else {
      final result = ReturnSaveFuncInfo<List<Admin?>>()..setError();
      return result;
    }
  }

  @override
  FutureOr<ReturnSaveFuncInfo<Admin>> findById(int id) async {
    final device = await db.admins.get(id);
    if (device == null) {
      final result = ReturnSaveFuncInfo<Admin>()..setError();
      return result;
    } else {
      final result = ReturnSaveFuncInfo<Admin>()..setValue(device);
      return result;
    }
  }

  @override
  FutureOr<ReturnSaveFuncInfo<Admin>> updateById(Admin object) async {
    final changedAdmin = await db.writeTxn(() => db.admins.put(object));
    if (changedAdmin == object.id) {
      final result = ReturnSaveFuncInfo<Admin>()..setValue(object);
      return result;
    } else {
      final result = ReturnSaveFuncInfo<Admin>()..setError();
      return result;
    }
  }
}
