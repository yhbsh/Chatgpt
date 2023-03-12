import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/domain.dart';
import '../../presentation.dart';

final chatCompletionNotifierProvider = NotifierProvider<ChatCompletionNotifier, ChatCompletionState>(ChatCompletionNotifier.new);

abstract class IChatCompletionNotifier {
  Future<void> completeChat({required List<ChatCompletionMessageInput> inputs});
}

class ChatCompletionNotifier extends Notifier<ChatCompletionState> implements IChatCompletionNotifier {
  CompleteChatUseCase get _completeChatUseCase => ref.read(completeChatUseCaseProvider);

  @override
  ChatCompletionState build() => const ChatCompletionState.notRequested();

  @override
  Future<void> completeChat({required List<ChatCompletionMessageInput> inputs}) async {
    final messages = inputs.map((object) => object.toEntity()).toList();
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
        state = ChatCompletionState.success(message: message);
      },
    );
  }
}
