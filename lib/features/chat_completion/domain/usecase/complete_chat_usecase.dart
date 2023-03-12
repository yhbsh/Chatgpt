import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../data/data.dart';
import '../domain.dart';

class CompleteChatUseCase extends IFutureUseCase<CompleteChatUseCaseParams, ChatCompletionMessageEntity> {
  final IChatCompletionRepository repository;

  CompleteChatUseCase({required this.repository});

  @override
  Future<Either<BaseFailure, ChatCompletionMessageEntity>> call({required CompleteChatUseCaseParams params}) {
    final request = ChatCompletionRequest(
      model: 'gpt-3.5-turbo-0301',
      messages: params.messages,
      temperature: 0.2,
      topP: 1,
      n: 1,
      presencePenalty: 1,
      frequencyPenalty: 0,
      logitBias: {},
    );
    return repository.completeChat(request: request);
  }
}

class CompleteChatUseCaseParams {
  final List<ChatCompletionMessageEntity> messages;

  const CompleteChatUseCaseParams({required this.messages});
}
