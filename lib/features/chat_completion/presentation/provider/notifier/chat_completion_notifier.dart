import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/domain.dart';
import '../../presentation.dart';

final chatCompletionNotifierProvider = NotifierProvider<ChatCompletionNotifier, ChatCompletionState>(ChatCompletionNotifier.new);

abstract class IChatCompletionNotifier {
  Future<void> completeChat({required List<ChatCompletionMessageObject> inputs});
}

class ChatCompletionNotifier extends Notifier<ChatCompletionState> implements IChatCompletionNotifier {
  CompleteChatUseCase get _completeChatUseCase => ref.read(completeChatUseCaseProvider);

  @override
  ChatCompletionState build() => const ChatCompletionState.notRequested();

  @override
  Future<void> completeChat({required List<ChatCompletionMessageObject> inputs}) async {
    final messages = inputs.map((object) => object.toEntity()).toList();
    final params = CompleteChatUseCaseParams(messages: messages);
    final result = await _completeChatUseCase(params: params);

    result.fold(
      (failure) {
        state = ChatCompletionState.failure(failure: failure);
        state = const ChatCompletionState.notRequested();
      },
      (message) {
        state = ChatCompletionState.success(message: message);
      },
    );
  }
}
