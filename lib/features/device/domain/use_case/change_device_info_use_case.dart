import 'package:asatic/features/core/models/returnSaveFuncInfo.dart';
import 'package:asatic/features/core/models/use_case.dart';
import 'package:asatic/features/device/data/repository_impl/device_repository_impl.dart';
import 'package:asatic/features/device/domain/models/device.dart';

///
class UpdateDeviceInfoUseCase
    extends UseCase<ReturnSaveFuncInfo<Device>, Device> {
  ///
  UpdateDeviceInfoUseCase(this.repo);

  ///
  final DeviceRepositoryImpl repo;
  @override
  Future<ReturnSaveFuncInfo<Device>> call(Device? param) async {
    if (param == null) {
      return ReturnSaveFuncInfo<Device>()..setError();
    } else {
      return repo.updateById(param);
    }
  }
}
