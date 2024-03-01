import 'dart:async';

import 'package:asatic/features/core/models/model_with_parent_id.dart';
import 'package:asatic/features/core/models/returnSaveFuncInfo.dart';

///
/// default and usally method of repositories
///
abstract class BaseRepository<T, R> {
  ///
  FutureOr<ReturnSaveFuncInfo<R>> create(ModelWithParentId<T> object);

  ///
  FutureOr<ReturnSaveFuncInfo<R>> findById(int id);

  ///
  FutureOr<ReturnSaveFuncInfo<List<R?>>> findAll();

  ///
  FutureOr<ReturnSaveFuncInfo<bool>> deleteById(ModelWithParentId<int> object);

  ///
  FutureOr<ReturnSaveFuncInfo<R>> updateById(T object);
}
