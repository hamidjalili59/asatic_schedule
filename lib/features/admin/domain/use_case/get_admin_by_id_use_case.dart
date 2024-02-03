import 'dart:async';

import 'package:asatic/features/admin/data/repository/admin_repository_impl.dart';
import 'package:asatic/features/admin/domain/models/admin.dart';
import 'package:asatic/features/core/models/returnSaveFuncInfo.dart';
import 'package:asatic/features/core/models/use_case.dart';

///
class FindAdminByIdUseCase extends UseCase<ReturnSaveFuncInfo<Admin>, int> {
  ///
  FindAdminByIdUseCase(this.repo);

  ///
  final AdminRepositoryImpl repo;
  @override
  FutureOr<ReturnSaveFuncInfo<Admin>> call(int? param) async {
    if (param == null) {
      return ReturnSaveFuncInfo<Admin>()..setError();
    } else {
      return repo.findById(param);
    }
  }
}
