import 'package:flutter/material.dart';

class CompleteChatTextField extends StatelessWidget {
  const CompleteChatTextField({super.key, required this.chatMessageController, required this.onRequestChatComplete});

  final TextEditingController chatMessageController;
  final VoidCallback onRequestChatComplete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        controller: chatMessageController,
        decoration: InputDecoration(
          hintText: 'Enter your message',
          suffixIcon: IconButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              fixedSize: MaterialStateProperty.all(const Size(20, 20)),
            ),
            splashRadius: 20,
            icon: const Icon(Icons.send),
            onPressed: onRequestChatComplete,
          ),
        ),
        onFieldSubmitted: (_) => onRequestChatComplete(),
      ),
    );
  }
}
