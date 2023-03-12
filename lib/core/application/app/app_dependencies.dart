import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core.dart';

final networkInfoProvider = Provider<INetworkInfo>((ref) => NetworkInfo());
