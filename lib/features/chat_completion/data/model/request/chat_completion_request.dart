// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/domain.dart';

part 'chat_completion_request.freezed.dart';
part 'chat_completion_request.g.dart';

@freezed
class ChatCompletionRequest with _$ChatCompletionRequest {
  const factory ChatCompletionRequest({
    @JsonKey(name: 'model') required String model,
    @JsonKey(name: 'messages') required List<ChatCompletionMessageEntity> messages,
    @JsonKey(name: 'temperature') required double temperature,
    @JsonKey(name: 'top_p') required double topP,
    @JsonKey(name: 'n') required int n,
    @JsonKey(name: 'presence_penalty') required double presencePenalty,
    @JsonKey(name: 'frequency_penalty') required double frequencyPenalty,
    @JsonKey(name: 'logit_bias') required Map<String, double> logitBias,
  }) = _ChatCompletionRequest;

  factory ChatCompletionRequest.fromJson(Map<String, dynamic> json) => _$ChatCompletionRequestFromJson(json);
}
