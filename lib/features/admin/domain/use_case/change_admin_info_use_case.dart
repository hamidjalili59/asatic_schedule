import 'package:asatic/features/admin/data/repository/admin_repository_impl.dart';
import 'package:asatic/features/admin/domain/models/admin.dart';
import 'package:asatic/features/core/models/returnSaveFuncInfo.dart';
import 'package:asatic/features/core/models/use_case.dart';

///
class UpdateAdminInfoUseCase extends UseCase<ReturnSaveFuncInfo<Admin>, Admin> {
  ///
  UpdateAdminInfoUseCase(this.repo);

  ///
  final AdminRepositoryImpl repo;
  @override
  Future<ReturnSaveFuncInfo<Admin>> call(Admin? param) async {
    if (param == null) {
      return ReturnSaveFuncInfo<Admin>()..setError();
    } else {
      return repo.updateById(param);
    }
  }
}
