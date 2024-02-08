import 'package:asatic/features/core/models/returnSaveFuncInfo.dart';
import 'package:asatic/features/core/models/use_case.dart';
import 'package:asatic/features/counter/data/repository_impl/counter_repository_impl.dart';
import 'package:asatic/features/counter/domain/models/counter.dart';

///
class CreateCounterUseCase
    extends UseCase<ReturnSaveFuncInfo<Counter>, Counter> {
  ///
  CreateCounterUseCase(this.repo);

  ///
  final CounterRepositoryImpl repo;
  @override
  Future<ReturnSaveFuncInfo<Counter>> call(Counter? param) async {
    if (param == null) {
      return ReturnSaveFuncInfo<Counter>()..setError();
    } else {
      return repo.create(param);
    }
  }
}