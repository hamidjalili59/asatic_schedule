import 'dart:async';

import 'package:asatic/features/admin/data/repository/admin_repository_impl.dart';
import 'package:asatic/features/admin/domain/models/get_admin_response.dart';
import 'package:asatic/features/core/models/returnSaveFuncInfo.dart';
import 'package:asatic/features/core/models/use_case.dart';

///
class FindAllAdminsUseCase
    extends UseCase<ReturnSaveFuncInfo<List<AdminResponse?>>, int> {
  ///
  FindAllAdminsUseCase(this.repo);

  ///
  final AdminRepositoryImpl repo;
  @override
  FutureOr<ReturnSaveFuncInfo<List<AdminResponse?>>> call(int? param) async {
    if (param == null) {
      return ReturnSaveFuncInfo<List<AdminResponse?>>()..setError();
    } else {
      return repo.findAll();
    }
  }
}
