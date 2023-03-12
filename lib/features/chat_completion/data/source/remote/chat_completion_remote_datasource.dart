import 'package:dio/dio.dart';

import '../../../../../core/core.dart';
import '../../data.dart';

abstract class IChatCompletionRemoteDataSource {
  Future<ChatCompletionResponse> completeChat({required ChatCompletionRequest request});
}

class ChatCompletionRemoteDataSource implements IChatCompletionRemoteDataSource {
  final IChatCompletionRestClient _client;

  const ChatCompletionRemoteDataSource({required IChatCompletionRestClient restClient}) : _client = restClient;

  @override
  Future<ChatCompletionResponse> completeChat({required ChatCompletionRequest request}) async {
    try {
      final response = await _client.completeChat(request: request);
      return response;
    } on DioError {
      throw const BaseException.serverError();
    } catch (exception) {
      rethrow;
    }
  }
}
