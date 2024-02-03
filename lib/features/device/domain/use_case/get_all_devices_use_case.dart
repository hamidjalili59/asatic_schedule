import 'dart:async';

import 'package:asatic/features/core/models/returnSaveFuncInfo.dart';
import 'package:asatic/features/core/models/use_case.dart';
import 'package:asatic/features/device/data/repository_impl/device_repository_impl.dart';
import 'package:asatic/features/device/domain/models/device.dart';

///
class FindAllDevicesUseCase
    extends UseCase<ReturnSaveFuncInfo<List<Device?>>, int> {
  ///
  FindAllDevicesUseCase(this.repo);

  ///
  final DeviceRepositoryImpl repo;
  @override
  FutureOr<ReturnSaveFuncInfo<List<Device?>>> call(int? param) async {
    if (param == null) {
      return ReturnSaveFuncInfo<List<Device?>>()..setError();
    } else {
      return repo.findAll();
    }
  }
}
