import 'package:dio/dio.dart';

import '../../../../../core/core.dart';
import '../../data.dart';

abstract class IChatCompletionRestClient {
  Future<ChatCompletionResponse> completeChat({required ChatCompletionRequest request});
}

class ChatCompletionRestClient implements IChatCompletionRestClient {
  final Dio _dio;

  const ChatCompletionRestClient({required Dio dio}) : _dio = dio;

  @override
  Future<ChatCompletionResponse> completeChat({required ChatCompletionRequest request}) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '${AppConst.openAIApiBaseUrl}/completions',
        data: request.toJson(),
        options: Options(headers: {'Authorization': 'Bearer ${AppConst.openAIApiKey}'}),
      );

      return ChatCompletionResponse.fromJson(response.data!);
    } on DioError {
      throw const BaseException.serverError();
    } catch (exception) {
      rethrow;
    }
  }
}
