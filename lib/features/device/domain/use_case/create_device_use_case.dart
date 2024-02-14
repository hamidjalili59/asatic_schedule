import 'package:asatic/features/core/models/model_with_parent_id.dart';
import 'package:asatic/features/core/models/returnSaveFuncInfo.dart';
import 'package:asatic/features/core/models/use_case.dart';
import 'package:asatic/features/device/data/repository_impl/device_repository_impl.dart';
import 'package:asatic/features/device/domain/models/device.dart';
import 'package:asatic/features/device/domain/models/get_device_response.dart';

///
class CreateDeviceUseCase extends UseCase<ReturnSaveFuncInfo<DeviceResponse>,
    ModelWithParentId<Device>> {
  ///
  CreateDeviceUseCase(this.repo);

  ///
  final DeviceRepositoryImpl repo;
  @override
  Future<ReturnSaveFuncInfo<DeviceResponse>> call(
    ModelWithParentId<Device>? param,
  ) async {
    if (param == null) {
      return ReturnSaveFuncInfo<DeviceResponse>()..setError();
    } else {
      return repo.create(param);
    }
  }
}
