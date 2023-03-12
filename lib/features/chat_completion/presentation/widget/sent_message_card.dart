import 'package:flutter/material.dart';

class SentMessageCard extends StatelessWidget {
  const SentMessageCard({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(left: 16, right: size.width * 0.3),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: ShapeDecoration(
          color: colorScheme.primary,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          ),
        ),
        child: Text(
          message,
          style: textTheme.bodyLarge!.copyWith(color: colorScheme.onPrimary, fontSize: size.width * 0.035 < 16 ? 16 : size.width * 0.035),
        ),
      ),
    );
  }
}
