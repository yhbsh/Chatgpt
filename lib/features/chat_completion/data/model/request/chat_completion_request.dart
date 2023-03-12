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
  }) = _ChatCompletionRequest;

  factory ChatCompletionRequest.fromJson(Map<String, dynamic> json) => _$ChatCompletionRequestFromJson(json);
}
