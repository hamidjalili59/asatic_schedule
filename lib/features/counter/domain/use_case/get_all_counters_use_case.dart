import 'dart:async';

import 'package:asatic/features/core/models/returnSaveFuncInfo.dart';
import 'package:asatic/features/core/models/use_case.dart';
import 'package:asatic/features/counter/data/repository_impl/counter_repository_impl.dart';
import 'package:asatic/features/counter/domain/models/get_counter_response.dart';

///
class FindAllCountersUseCase
    extends UseCase<ReturnSaveFuncInfo<List<CounterResponse?>>, int> {
  ///
  FindAllCountersUseCase(this.repo);

  ///
  final CounterRepositoryImpl repo;
  @override
  FutureOr<ReturnSaveFuncInfo<List<CounterResponse?>>> call(int? param) async {
    if (param == null) {
      return ReturnSaveFuncInfo<List<CounterResponse?>>()..setError();
    } else {
      return repo.findAll();
    }
  }
}
