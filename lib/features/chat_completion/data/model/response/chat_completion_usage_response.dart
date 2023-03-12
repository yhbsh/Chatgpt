// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_completion_usage_response.freezed.dart';
part 'chat_completion_usage_response.g.dart';

@freezed
class ChatCompletionUsageResponse with _$ChatCompletionUsageResponse {
  const factory ChatCompletionUsageResponse({
    @JsonKey(name: 'prompt_tokens') required int promptTokens,
    @JsonKey(name: 'completion_tokens') required int completionTokens,
    @JsonKey(name: 'total_tokens') required int totalTokens,
  }) = _ChatCompletionUsageResponse;

  factory ChatCompletionUsageResponse.fromJson(Map<String, dynamic> json) => _$ChatCompletionUsageResponseFromJson(json);
}
