import 'dart:async';

import 'package:asatic/features/core/models/returnSaveFuncInfo.dart';
import 'package:asatic/features/core/models/use_case.dart';
import 'package:asatic/features/counter/data/repository_impl/counter_repository_impl.dart';
import 'package:asatic/features/counter/domain/models/get_counter_response.dart';

///
class FindCounterByIdUseCase
    extends UseCase<ReturnSaveFuncInfo<CounterResponse>, int> {
  ///
  FindCounterByIdUseCase(this.repo);

  ///
  final CounterRepositoryImpl repo;
  @override
  FutureOr<ReturnSaveFuncInfo<CounterResponse>> call(int? param) async {
    if (param == null) {
      return ReturnSaveFuncInfo<CounterResponse>()..setError();
    } else {
      return repo.findById(param);
    }
  }
}
