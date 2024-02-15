import 'package:asatic/features/admin/data/repository/admin_repository_impl.dart';
import 'package:asatic/features/admin/domain/models/admin.dart';
import 'package:asatic/features/admin/domain/models/get_admin_response.dart';
import 'package:asatic/features/core/models/returnSaveFuncInfo.dart';
import 'package:asatic/features/core/models/use_case.dart';

///
class CreateAdminUseCase
    extends UseCase<ReturnSaveFuncInfo<AdminResponse>, Admin> {
  ///
  CreateAdminUseCase(this.repo);

  ///
  final AdminRepositoryImpl repo;
  @override
  Future<ReturnSaveFuncInfo<AdminResponse>> call(Admin? param) async {
    if (param == null) {
      return ReturnSaveFuncInfo<AdminResponse>()..setError();
    } else {
      return repo.create(param);
    }
  }
}
