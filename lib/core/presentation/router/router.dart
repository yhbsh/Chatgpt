import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../features/chat_completion/chat_completion.dart';

final routerProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: 'chat',
          builder: (context, state) => const ChatView(),
        ),
      ],
    );
  },
);
