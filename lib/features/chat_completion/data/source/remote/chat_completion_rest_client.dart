import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../../../../core/core.dart';
import '../../data.dart';

part 'chat_completion_rest_client.g.dart';

@RestApi(baseUrl: 'https://api.openai.com/v1/chat')
abstract class IChatCompletionRestClient {
  factory IChatCompletionRestClient(Dio dio, {String baseUrl}) = _IChatCompletionRestClient;

  @POST('/completions')
  @Headers({'Authorization': AppConst.openAIApiKey})
  Future<ChatCompletionResponse> completeChat({required ChatCompletionRequest request});
}
