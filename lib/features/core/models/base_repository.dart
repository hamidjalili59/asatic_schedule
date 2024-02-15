import 'dart:async';

import 'package:asatic/features/core/models/returnSaveFuncInfo.dart';

///
/// default and usally method of repositories
///
abstract class BaseRepository<T, R> {
  ///
  FutureOr<ReturnSaveFuncInfo<R>> create(T object);

  ///
  FutureOr<ReturnSaveFuncInfo<R>> findById(int id);

  ///
  FutureOr<ReturnSaveFuncInfo<List<R?>>> findAll();

  ///
  FutureOr<ReturnSaveFuncInfo<bool>> deleteById(int id);

  ///
  FutureOr<ReturnSaveFuncInfo<R>> updateById(T object);
}
