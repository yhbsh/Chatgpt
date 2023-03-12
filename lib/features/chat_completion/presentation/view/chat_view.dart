import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/core.dart';
import '../presentation.dart';

class ChatView extends HookConsumerWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('ChatView build');

    final chatMessageController = useTextEditingController();

    final messagesValueNotifier = useState<List<String>>([]);

    // listen to chatCompletionNotifierProvider
    ref.listen(
      chatCompletionNotifierProvider,
      (previous, next) {
        next.whenOrNull(
          success: (message) {
            // save message to chatHistoryNotifierProvider
            final input = ChatCompletionMessageInput.fromEntity(message);
            ref.read(chatHistoryNotifierProvider.notifier).saveMessage(message: input);
          },
        );
      },
    );

    void completeChat() {
      if (chatMessageController.text.isEmpty) return;

      // add message to messagesValueNotifier
      messagesValueNotifier.value = [...messagesValueNotifier.value, chatMessageController.text];

      // get chat history from chatHistoryNotifierProvider
      final chatHistory = ref.read(chatHistoryNotifierProvider);

      // complete chat
      ref.read(chatCompletionNotifierProvider.notifier).completeChat(
        inputs: [
          ...chatHistory,
          ChatCompletionMessageInput(
            role: ChatCompletionMessageRole.user,
            content: chatMessageController.text,
          ),
        ],
      );

      chatMessageController.clear();
    }

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(AppAssets.chatGPTLogoSvgPath, fit: BoxFit.cover),
        ),
        title: const Text('ChatGPT'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () => ref.read(themeModeNotifierProvider.notifier).toggleThemeMode(),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          ChatMessagesListView(messages: messagesValueNotifier.value),
          CompleteChatTextField(
            chatMessageController: chatMessageController,
            onRequestChatComplete: completeChat,
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
