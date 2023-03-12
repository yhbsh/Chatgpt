// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_completion_message_entity.freezed.dart';
part 'chat_completion_message_entity.g.dart';

@freezed
class ChatCompletionMessageEntity with _$ChatCompletionMessageEntity {
  const factory ChatCompletionMessageEntity({
    @JsonKey(name: 'role') required String role,
    @JsonKey(name: 'content') required String content,
  }) = _ChatCompletionMessageEntity;

  factory ChatCompletionMessageEntity.fromJson(Map<String, dynamic> json) => _$ChatCompletionMessageEntityFromJson(json);
}
