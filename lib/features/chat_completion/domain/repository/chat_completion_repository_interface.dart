import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../data/data.dart';
import '../domain.dart';

abstract class IChatCompletionRepository {
  Future<Either<BaseFailure, ChatCompletionMessageEntity>> completeChat({required ChatCompletionRequest request});
}
