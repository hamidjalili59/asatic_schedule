import 'package:asatic/features/core/models/model_with_parent_id.dart';
import 'package:asatic/features/core/models/returnSaveFuncInfo.dart';
import 'package:asatic/features/core/models/use_case.dart';
import 'package:asatic/features/queue/data/repository/queue_repository_impl.dart';
import 'package:asatic/features/queue/domain/models/queue.dart';

///
class UpdateQueueInfoUseCase extends UseCase<ReturnSaveFuncInfo<QueueModel>,
    ModelWithParentId<QueueModel>> {
  ///
  UpdateQueueInfoUseCase(this.repo);

  ///
  final QueueRepositoryImpl repo;
  @override
  Future<ReturnSaveFuncInfo<QueueModel>> call(
    ModelWithParentId<QueueModel>? param,
  ) async {
    if (param == null) {
      return ReturnSaveFuncInfo<QueueModel>()..setError();
    } else {
      return repo.updateById(param);
    }
  }
}
