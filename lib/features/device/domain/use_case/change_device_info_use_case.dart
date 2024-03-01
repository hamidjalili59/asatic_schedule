import 'package:asatic/features/core/models/returnSaveFuncInfo.dart';
import 'package:asatic/features/core/models/use_case.dart';
import 'package:asatic/features/device/data/repository_impl/device_repository_impl.dart';
import 'package:asatic/features/device/domain/models/device.dart';
import 'package:asatic/features/device/domain/models/get_device_response.dart';

///
class UpdateDeviceInfoUseCase
    extends UseCase<ReturnSaveFuncInfo<DeviceResponse>, Device> {
  ///
  UpdateDeviceInfoUseCase(this.repo);

  ///
  final DeviceRepositoryImpl repo;
  @override
  Future<ReturnSaveFuncInfo<DeviceResponse>> call(
    Device? param,
  ) async {
    if (param == null) {
      return ReturnSaveFuncInfo<DeviceResponse>()..setError();
    } else {
      return repo.updateById(param);
    }
  }
}
