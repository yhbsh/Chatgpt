
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../presentation.dart';

class ChatMessagesListView extends ConsumerWidget {
  const ChatMessagesListView({super.key, required this.messages});

  final List<String> messages;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // get last message from chat history
    final chatHistory = ref.watch(conversationHistoryNotifierProvider);

    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            children: List.generate(
              messages.length,
              (index) {
                // either requested(Loading) state or initial state
                if (chatHistory.length <= index) {
                  return Column(
                    children: [
                      SentMessageCard(message: messages.elementAt(index)),
                      const SizedBox(height: 16),
                      const ShimmerMessagePlaceHolder(),
                    ],
                  );
                }

                // either success or failure state
                return SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      SentMessageCard(message: messages.elementAt(index)),
                      const SizedBox(height: 16),
                      RecievedMessageCard(
                        message: index == 0 //
                            ? chatHistory.elementAt(index).content.split('\n').sublist(1).join()
                            : chatHistory.elementAt(index).content,
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
