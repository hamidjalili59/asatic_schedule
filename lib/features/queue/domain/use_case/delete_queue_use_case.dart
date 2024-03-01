import 'package:asatic/features/core/models/model_with_parent_id.dart';
import 'package:asatic/features/core/models/returnSaveFuncInfo.dart';
import 'package:asatic/features/core/models/use_case.dart';
import 'package:asatic/features/queue/data/repository/queue_repository_impl.dart';

///
class DeleteQueueUseCase
    extends UseCase<ReturnSaveFuncInfo<bool>, ModelWithParentId<int>> {
  ///
  DeleteQueueUseCase(this.repo);

  ///
  final QueueRepositoryImpl repo;
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
