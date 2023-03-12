import 'package:dartz/dartz.dart';

import '../../core.dart';

abstract class IFutureUseCase<Params, T> {
  Future<Either<BaseFailure, T>> call({required Params params});
}
