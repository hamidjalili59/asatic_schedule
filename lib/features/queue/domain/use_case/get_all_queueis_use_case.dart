import 'dart:async';

import 'package:asatic/features/core/models/returnSaveFuncInfo.dart';
import 'package:asatic/features/core/models/use_case.dart';
import 'package:asatic/features/queue/data/repository/queue_repository_impl.dart';
import 'package:asatic/features/queue/domain/models/queue.dart';

///
class FindAllQueuesUseCase
    extends UseCase<ReturnSaveFuncInfo<List<QueueModel?>>, int> {
  ///
  FindAllQueuesUseCase(this.repo);

  ///
  final QueueRepositoryImpl repo;
  @override
  FutureOr<ReturnSaveFuncInfo<List<QueueModel?>>> call(int? param) async {
    if (param == null) {
      return ReturnSaveFuncInfo<List<QueueModel?>>()..setError();
    } else {
      return repo.findAll();
    }
  }
}
