import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../presentation.dart';

class ChatView extends HookConsumerWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('ChatView build');

    final chatMessageController = useTextEditingController();
    final messagesValueNotifier = useState<List<String>>([]);

    void completeChat() {
      if (chatMessageController.text.isEmpty) return;

      // add message to messagesValueNotifier
      messagesValueNotifier.value = [...messagesValueNotifier.value, chatMessageController.text];

      // complete chat
      final input = ChatCompletionMessageInput(role: ChatCompletionMessageRole.user, content: chatMessageController.text);
      ref.read(chatCompletionNotifierProvider.notifier).completeChat(input: input);

      chatMessageController.clear();
    }

    return Scaffold(
      appBar: ChatViewAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          ChatMessagesListView(messages: messagesValueNotifier.value),
          CompleteChatTextField(controller: chatMessageController, onFieldSubmitted: completeChat),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
