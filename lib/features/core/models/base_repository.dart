import 'dart:async';

import 'package:asatic/features/core/models/returnSaveFuncInfo.dart';

///
/// implement default and usally method of repositories
///
abstract class BaseRepository<T> {
  ///
  FutureOr<ReturnSaveFuncInfo<T>> create(T object);

  ///
  FutureOr<ReturnSaveFuncInfo<T>> findById(int id);

  ///
  FutureOr<ReturnSaveFuncInfo<List<T?>>> findAll();

  ///
  FutureOr<ReturnSaveFuncInfo<bool>> deleteById(int id);

  ///
  FutureOr<ReturnSaveFuncInfo<T>> updateById(T object);
}
