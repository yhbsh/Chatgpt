import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/domain.dart';
import '../../presentation.dart';

final chatCompletionNotifierProvider = NotifierProvider<ChatCompletionNotifier, ChatCompletionState>(ChatCompletionNotifier.new);

abstract class IChatCompletionNotifier {
  Future<void> completeChat({required ChatCompletionMessageInput input});
}

class ChatCompletionNotifier extends Notifier<ChatCompletionState> implements IChatCompletionNotifier {
  CompleteChatUseCase get _completeChatUseCase => ref.read(completeChatUseCaseProvider);

  @override
  ChatCompletionState build() {
    return const ChatCompletionState.notRequested();
  }

  @override
  Future<void> completeChat({required ChatCompletionMessageInput input}) async {
    state = const ChatCompletionState.requested();

    // get conversation history
    final conversationHistory = ref.read(conversationHistoryNotifierProvider);

    // add input to complete chat inputs
    final inputs = [...conversationHistory, input];

    // convert inputs to messages
    final messages = inputs.map((object) => object.toEntity()).toList();

    // complete chat
    final params = CompleteChatUseCaseParams(messages: messages);
    final result = await _completeChatUseCase(params: params);

    result.fold(
      (failure) {
        debugPrint('complete chat failure');
        state = ChatCompletionState.failure(failure: failure);
        state = const ChatCompletionState.notRequested();
      },
      (message) {
        debugPrint('complete chat success');

        // save message to conversation history
        final input = ChatCompletionMessageInput.fromEntity(message);
        ref.read(conversationHistoryNotifierProvider.notifier).saveMessage(message: input);

        state = ChatCompletionState.success(message: message);
      },
    );
  }
}
