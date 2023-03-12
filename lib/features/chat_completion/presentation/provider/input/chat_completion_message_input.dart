import '../../../domain/domain.dart';
import '../../presentation.dart';

class ChatCompletionMessageInput {
  final ChatCompletionMessageRole role;
  final String content;

  const ChatCompletionMessageInput({required this.role, required this.content});

  ChatCompletionMessageEntity toEntity() => ChatCompletionMessageEntity(role: role.name, content: content);

  factory ChatCompletionMessageInput.fromEntity(ChatCompletionMessageEntity entity) => ChatCompletionMessageInput(role: ChatCompletionMessageRole.values.firstWhere((e) => e.name == entity.role), content: entity.content);

  @override
  String toString() => 'ChatCompletionMessageInput(role: $role, content: $content)';
}
