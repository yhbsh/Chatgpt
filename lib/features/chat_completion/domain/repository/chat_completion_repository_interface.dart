import '../../data/data.dart';
import '../domain.dart';

abstract class IChatCompletionRepository {
  Future<ChatCompletionMessageEntity> completeChat({required ChatCompletionRequest request});
}
