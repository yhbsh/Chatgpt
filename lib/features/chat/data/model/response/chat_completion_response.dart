// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data.dart';

part 'chat_completion_response.freezed.dart';
part 'chat_completion_response.g.dart';

@freezed
class ChatCompletionResponse with _$ChatCompletionResponse {
  const factory ChatCompletionResponse({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'object') required String object,
    @JsonKey(name: 'created') required int created,
    @JsonKey(name: 'usage') required ChatCompletionUsageResponse usage,
    @JsonKey(name: 'choices') required List<ChatCompletionChoiceResponse> choices,
  }) = _ChatCompletionResponse;

  factory ChatCompletionResponse.fromJson(Map<String, dynamic> json) => _$ChatCompletionResponseFromJson(json);
}
