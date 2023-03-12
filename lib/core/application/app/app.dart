import 'package:flutter/material.dart';

import '../../../features/chat/chat.dart';

class ChatGPTApp extends StatelessWidget {
  const ChatGPTApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: ChatView());
  }
}
