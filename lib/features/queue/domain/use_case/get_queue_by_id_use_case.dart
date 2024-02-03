import 'dart:async';

import 'package:asatic/features/core/models/returnSaveFuncInfo.dart';
import 'package:asatic/features/core/models/use_case.dart';
import 'package:asatic/features/queue/data/repository/queue_repository_impl.dart';
import 'package:asatic/features/queue/domain/models/queue.dart';

///
class FindQueueByIdUseCase
    extends UseCase<ReturnSaveFuncInfo<QueueModel>, int> {
  ///
  FindQueueByIdUseCase(this.repo);

  ///
  final QueueRepositoryImpl repo;
  @override
  FutureOr<ReturnSaveFuncInfo<QueueModel>> call(int? param) async {
    if (param == null) {
      return ReturnSaveFuncInfo<QueueModel>()..setError();
    } else {
      return repo.findById(param);
    }
  }
}
