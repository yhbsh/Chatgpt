import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/core.dart';

class ChatViewAppBar extends ConsumerWidget with PreferredSizeWidget {
  const ChatViewAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
