import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

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
    } on DioError catch (exception) {
      debugPrint('DioError: ${exception.response?.data['error']['message']}');
      throw const BaseException.serverError();
    } catch (exception) {
      debugPrint('Exception: $exception');
      rethrow;
    }
  }
}
