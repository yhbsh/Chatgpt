// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/domain.dart';

part 'chat_completion_choice_response.freezed.dart';
part 'chat_completion_choice_response.g.dart';

@freezed
class ChatCompletionChoiceResponse with _$ChatCompletionChoiceResponse {
  const factory ChatCompletionChoiceResponse({
    @JsonKey(name: 'message') required ChatCompletionMessageEntity message,
    @JsonKey(name: 'finish_reason') required String finishReason,
    @JsonKey(name: 'index') required int index,
  }) = _ChatCompletionChoiceResponse;

  factory ChatCompletionChoiceResponse.fromJson(Map<String, dynamic> json) => _$ChatCompletionChoiceResponseFromJson(json);
}
