import 'package:asatic/features/admin/data/repository/admin_repository_impl.dart';
import 'package:asatic/features/core/models/model_with_parent_id.dart';
import 'package:asatic/features/core/models/returnSaveFuncInfo.dart';
import 'package:asatic/features/core/models/use_case.dart';

///
class DeleteAdminUseCase
    extends UseCase<ReturnSaveFuncInfo<bool>, ModelWithParentId<int>> {
  ///
  DeleteAdminUseCase(this.repo);

  ///
  final AdminRepositoryImpl repo;
  @override
  Future<ReturnSaveFuncInfo<bool>> call(
    ModelWithParentId<int>? param,
  ) async {
    if (param == null) {
      return ReturnSaveFuncInfo<bool>()..setError();
    } else {
      return repo.deleteById(param);
    }
  }
}
