import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../presentation.dart';

final chatHistoryNotifierProvider = NotifierProvider<ChatHistoryNotifier, List<ChatCompletionMessageInput>>(ChatHistoryNotifier.new);

abstract class IChatHistoryNotifier {
  void saveMessage({required ChatCompletionMessageInput message});
}

class ChatHistoryNotifier extends Notifier<List<ChatCompletionMessageInput>> implements IChatHistoryNotifier {
  @override
  List<ChatCompletionMessageInput> build() {
    return [];
  }

  @override
  void saveMessage({required ChatCompletionMessageInput message}) {
    state = [...state, message];
  }
}
