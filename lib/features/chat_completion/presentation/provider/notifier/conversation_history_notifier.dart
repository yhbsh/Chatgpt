import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../presentation.dart';

final conversationHistoryNotifierProvider = NotifierProvider<ConversationHistoryNotifier, List<ChatCompletionMessageInput>>(ConversationHistoryNotifier.new);

abstract class IConversationHistoryNotifier {
  void saveMessage({required ChatCompletionMessageInput message});
}

class ConversationHistoryNotifier extends Notifier<List<ChatCompletionMessageInput>> implements IConversationHistoryNotifier {
  @override
  List<ChatCompletionMessageInput> build() => [];

  @override
  void saveMessage({required ChatCompletionMessageInput message}) {
    state = [...state, message];
  }
}
