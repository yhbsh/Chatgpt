import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';
import '../data.dart';

class ChatCompletionRepository implements IChatCompletionRepository {
  final IChatCompletionRemoteDataSource _remoteDataSource;
  final INetworkInfo _networkInfo;

  const ChatCompletionRepository({
    required IChatCompletionRemoteDataSource remoteDataSource,
    required INetworkInfo networkInfo,
  })  : _remoteDataSource = remoteDataSource,
        _networkInfo = networkInfo;

  @override
  Future<Either<BaseFailure, ChatCompletionMessageEntity>> completeChat({required ChatCompletionRequest request}) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.completeChat(request: request);
        return right(response.choices.first.message);
      } on BaseException catch (exception) {
        return left(BaseFailure(message: exception.message));
      } catch (exception) {
        return left(const BaseFailure.unexpected());
      }
    } else {
      return left(const BaseFailure.noInternetConnection());
    }
  }
}
