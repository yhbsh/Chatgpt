import '../../../domain/domain.dart';
import '../../presentation.dart';

class ChatCompletionMessageInput {
  final ChatCompletionMessageRole role;
  final String content;

  const ChatCompletionMessageInput({required this.role, required this.content});

  ChatCompletionMessageEntity toEntity() => ChatCompletionMessageEntity(role: role.name, content: content);
}
