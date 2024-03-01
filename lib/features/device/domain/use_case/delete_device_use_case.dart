import 'package:asatic/features/core/models/model_with_parent_id.dart';
import 'package:asatic/features/core/models/returnSaveFuncInfo.dart';
import 'package:asatic/features/core/models/use_case.dart';
import 'package:asatic/features/device/data/repository_impl/device_repository_impl.dart';

///
class DeleteDeviceUseCase
    extends UseCase<ReturnSaveFuncInfo<bool>, ModelWithParentId<int>> {
  ///
  DeleteDeviceUseCase(this.repo);

  ///
  final DeviceRepositoryImpl repo;
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
