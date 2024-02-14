import 'package:asatic/features/core/models/model_with_parent_id.dart';
import 'package:asatic/features/core/models/returnSaveFuncInfo.dart';
import 'package:asatic/features/core/models/use_case.dart';
import 'package:asatic/features/counter/data/repository_impl/counter_repository_impl.dart';
import 'package:asatic/features/counter/domain/models/counter.dart';
import 'package:asatic/features/counter/domain/models/get_counter_response.dart';

///
class UpdateCounterInfoUseCase extends UseCase<
    ReturnSaveFuncInfo<CounterResponse>, ModelWithParentId<Counter>> {
  ///
  UpdateCounterInfoUseCase(this.repo);

  ///
  final CounterRepositoryImpl repo;
  @override
  Future<ReturnSaveFuncInfo<CounterResponse>> call(
    ModelWithParentId<Counter>? param,
  ) async {
    if (param == null) {
      return ReturnSaveFuncInfo<CounterResponse>()..setError();
    } else {
      return repo.updateById(param);
    }
  }
}
