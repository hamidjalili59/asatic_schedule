import 'dart:async';

///
/// i create this class in generic type
/// generic Means:
///
/// R (Return Type):
///     write any type of you want to return this type
///
/// D (Data Type):
///     we can write own Failure and return it when our function is broke
///
// ignore: one_member_abstracts
abstract class UseCase<R, D> {
  ///
  FutureOr<R> call(D? param);
}
