import 'package:flutter/material.dart';

class CompleteChatTextField extends StatelessWidget {
  const CompleteChatTextField({super.key, required this.controller, required this.onFieldSubmitted});

  final TextEditingController controller;
  final VoidCallback onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Enter your message',
          suffixIcon: IconButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              fixedSize: MaterialStateProperty.all(const Size(20, 20)),
            ),
            splashRadius: 20,
            icon: const Icon(Icons.send),
            onPressed: onFieldSubmitted,
          ),
        ),
        onFieldSubmitted: (_) => onFieldSubmitted(),
      ),
    );
  }
}
