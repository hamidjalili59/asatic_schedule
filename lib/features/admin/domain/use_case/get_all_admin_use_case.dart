import 'dart:async';

import 'package:asatic/features/admin/data/repository/admin_repository_impl.dart';
import 'package:asatic/features/admin/domain/models/admin.dart';
import 'package:asatic/features/core/models/returnSaveFuncInfo.dart';
import 'package:asatic/features/core/models/use_case.dart';

///
class FindAllAdminsUseCase
    extends UseCase<ReturnSaveFuncInfo<List<Admin?>>, int> {
  ///
  FindAllAdminsUseCase(this.repo);

  ///
  final AdminRepositoryImpl repo;
  @override
  FutureOr<ReturnSaveFuncInfo<List<Admin?>>> call(int? param) async {
    if (param == null) {
      return ReturnSaveFuncInfo<List<Admin?>>()..setError();
    } else {
      return repo.findAll();
    }
  }
}
