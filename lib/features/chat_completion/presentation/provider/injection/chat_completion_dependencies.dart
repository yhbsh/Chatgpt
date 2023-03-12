import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/core.dart';
import '../../../data/data.dart';
import '../../../domain/domain.dart';

final chatCompletionRestClientProvider = Provider<IChatCompletionRestClient>(
  (ref) => IChatCompletionRestClient(
    ref.read(dioProvider),
  ),
);
final chatCompletionRemoteDataSourceProvider = Provider<IChatCompletionRemoteDataSource>(
  (ref) => ChatCompletionRemoteDataSource(
    restClient: ref.read(chatCompletionRestClientProvider),
  ),
);
final chatCompletionRepositoryProvider = Provider<IChatCompletionRepository>(
  (ref) => ChatCompletionRepository(
    remoteDataSource: ref.read(chatCompletionRemoteDataSourceProvider),
    networkInfo: ref.read(networkInfoProvider),
  ),
);

final completeChatUseCaseProvider = Provider<CompleteChatUseCase>(
  (ref) => CompleteChatUseCase(
    repository: ref.read(chatCompletionRepositoryProvider),
  ),
);
