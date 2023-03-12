import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/core.dart';

void main() {
  const app = ProviderScope(child: ChatGPTApp());

  runApp(app);
}
