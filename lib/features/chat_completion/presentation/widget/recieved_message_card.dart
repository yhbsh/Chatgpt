import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RecievedMessageCard extends HookWidget {
  const RecievedMessageCard({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    final formattedMessageList = message.split('\n').join().split(' ');

    final messageValueNotifier = useState<String>(formattedMessageList.first);

    useEffect(
      () {
        Timer.periodic(
          const Duration(milliseconds: 70),
          (timer) {
            final tick = timer.tick;

            if (tick >= formattedMessageList.length) {
              timer.cancel();
              return;
            }

            messageValueNotifier.value = '${messageValueNotifier.value} ${formattedMessageList[tick]}';
          },
        );
        return null;
      },
      const [],
    );

    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.only(right: 16, left: size.width * 0.3),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: ShapeDecoration(
          color: colorScheme.secondary.withOpacity(0.8),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
        ),
        child: Text(
          messageValueNotifier.value,
          style: textTheme.bodyLarge!.copyWith(
            color: colorScheme.onSecondary,
            fontSize: size.width * 0.035 < 16 ? 16 : size.width * 0.035,
          ),
        ),
      ),
    );
  }
}
