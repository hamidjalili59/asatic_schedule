import 'package:asatic/features/admin/data/repository/admin_repository_impl.dart';
import 'package:asatic/features/admin/domain/use_case/change_admin_info_use_case.dart';
import 'package:asatic/features/admin/domain/use_case/create_admin_use_case.dart';
import 'package:asatic/features/admin/domain/use_case/delete_device_use_case.dart';
import 'package:asatic/features/admin/domain/use_case/get_admin_by_id_use_case.dart';
import 'package:asatic/features/admin/domain/use_case/get_all_admin_use_case.dart';
import 'package:asatic/features/device/data/repository_impl/device_repository_impl.dart';
import 'package:asatic/features/device/domain/use_case/change_device_info_use_case.dart';
import 'package:asatic/features/device/domain/use_case/create_device_use_case.dart';
import 'package:asatic/features/device/domain/use_case/delete_device_use_case.dart';
import 'package:asatic/features/device/domain/use_case/get_all_devices_use_case.dart';
import 'package:asatic/features/device/domain/use_case/get_device_by_id_use_case.dart';
import 'package:asatic/features/queue/data/repository/queue_repository_impl.dart';
import 'package:asatic/features/queue/domain/use_case/change_queue_info_use_case.dart';
import 'package:asatic/features/queue/domain/use_case/create_queue_use_case.dart';
import 'package:asatic/features/queue/domain/use_case/delete_queue_use_case.dart';
import 'package:asatic/features/queue/domain/use_case/get_all_queueis_use_case.dart';
import 'package:asatic/features/queue/domain/use_case/get_queue_by_id_use_case.dart';
import 'package:get_it/get_it.dart';

/// service locator instance
GetIt locator = GetIt.instance;

/// setup sevice locator call it in main
void setUp() {
  locator

    /// Devices
    ..registerSingleton<DeviceRepositoryImpl>(DeviceRepositoryImpl())
    ..registerSingleton<CreateDeviceUseCase>(CreateDeviceUseCase(locator()))
    ..registerSingleton<DeleteDeviceUseCase>(DeleteDeviceUseCase(locator()))
    ..registerSingleton<UpdateDeviceInfoUseCase>(
      UpdateDeviceInfoUseCase(locator()),
    )
    ..registerSingleton<FindAllDevicesUseCase>(FindAllDevicesUseCase(locator()))
    ..registerSingleton<FindDeviceByIdUseCase>(
      FindDeviceByIdUseCase(locator()),
    )

    /// Queues
    ..registerSingleton<QueueRepositoryImpl>(QueueRepositoryImpl())
    ..registerSingleton<CreateQueueUseCase>(CreateQueueUseCase(locator()))
    ..registerSingleton<DeleteQueueUseCase>(DeleteQueueUseCase(locator()))
    ..registerSingleton<UpdateQueueInfoUseCase>(
      UpdateQueueInfoUseCase(locator()),
    )
    ..registerSingleton<FindAllQueuesUseCase>(FindAllQueuesUseCase(locator()))
    ..registerSingleton<FindQueueByIdUseCase>(
      FindQueueByIdUseCase(locator()),
    )

    /// Admins
    ..registerSingleton<AdminRepositoryImpl>(AdminRepositoryImpl())
    ..registerSingleton<CreateAdminUseCase>(CreateAdminUseCase(locator()))
    ..registerSingleton<DeleteAdminUseCase>(DeleteAdminUseCase(locator()))
    ..registerSingleton<UpdateAdminInfoUseCase>(
      UpdateAdminInfoUseCase(locator()),
    )
    ..registerSingleton<FindAllAdminsUseCase>(FindAllAdminsUseCase(locator()))
    ..registerSingleton<FindAdminByIdUseCase>(
      FindAdminByIdUseCase(locator()),
    );
}
