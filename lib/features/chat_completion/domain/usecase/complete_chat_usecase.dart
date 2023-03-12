import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../data/data.dart';
import '../domain.dart';

class CompleteChatUseCase extends IFutureUseCase<CompleteChatUseCaseParams, ChatCompletionMessageEntity> {
  final IChatCompletionRepository repository;

  CompleteChatUseCase({required this.repository});

  @override
  Future<Either<BaseFailure, ChatCompletionMessageEntity>> call({required CompleteChatUseCaseParams params}) {
    final request = ChatCompletionRequest(model: 'gpt-3.5-turbo', messages: params.messages);
    return repository.completeChat(request: request);
  }
}

class CompleteChatUseCaseParams {
  final List<ChatCompletionMessageEntity> messages;

  const CompleteChatUseCaseParams({required this.messages});
}
