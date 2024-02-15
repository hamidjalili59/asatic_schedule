import 'dart:async';

import 'package:asatic/features/admin/domain/models/admin.dart';
import 'package:asatic/features/admin/domain/models/get_admin_response.dart';
import 'package:asatic/features/core/extentions_utils.dart';
import 'package:asatic/features/core/models/base_repository.dart';
import 'package:asatic/features/core/models/returnSaveFuncInfo.dart';
import 'package:asatic/features/locator.dart';
import 'package:isar/isar.dart';

///
/// implement logic of device data here
///
class AdminRepositoryImpl extends BaseRepository<Admin, AdminResponse> {
  /// instance of ISAR Database
  late Isar db = locator.get<Isar>();
  @override
  FutureOr<ReturnSaveFuncInfo<AdminResponse>> create(Admin object) async {
    try {
      final newAdmin = Admin(
        name: object.name ?? 'UNNAMED',
        address: object.address ?? 'UNTAGGED',
        password: object.password ?? 'UNKNOWN',
        phone: object.phone ?? 0,
        deviceList: object.deviceList,
      );

      await db.writeTxn(
        () async => db.admins.put(newAdmin), // insert & update
      );
      final result = ReturnSaveFuncInfo<AdminResponse>()
        ..setValue(await newAdmin.toAdminResponse());
      return result;
    } catch (e) {
      final result = ReturnSaveFuncInfo<AdminResponse>()..setError();
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
  FutureOr<ReturnSaveFuncInfo<List<AdminResponse?>>> findAll() async {
    final adminList = await db.admins.getAll(
      List.generate(await db.admins.count(), (index) => index + 1),
    );

    final responseAdmins = List<AdminResponse?>.empty(growable: true);
    for (final element in adminList) {
      responseAdmins.add(await element?.toAdminResponse());
    }

    if (adminList.isNotEmpty) {
      final result = ReturnSaveFuncInfo<List<AdminResponse?>>()
        ..setValue(responseAdmins);
      return result;
    } else {
      final result = ReturnSaveFuncInfo<List<AdminResponse?>>()..setError();
      return result;
    }
  }

  @override
  FutureOr<ReturnSaveFuncInfo<AdminResponse>> findById(int id) async {
    final admin = await db.admins.get(id);
    if (admin == null) {
      final result = ReturnSaveFuncInfo<AdminResponse>()..setError();
      return result;
    } else {
      final result = ReturnSaveFuncInfo<AdminResponse>()
        ..setValue(await admin.toAdminResponse());
      return result;
    }
  }

  @override
  FutureOr<ReturnSaveFuncInfo<AdminResponse>> updateById(Admin object) async {
    final changedAdmin = await db.writeTxn(() => db.admins.put(object));
    if (changedAdmin == object.id) {
      final result = ReturnSaveFuncInfo<AdminResponse>()
        ..setValue(await object.toAdminResponse());
      return result;
    } else {
      final result = ReturnSaveFuncInfo<AdminResponse>()..setError();
      return result;
    }
  }
}
