import '../../data/data.dart';
import '../domain.dart';

abstract class IChatCompletionRepository {
  Future<ChatCompletionMessageEntity> complete({required ChatCompletionRequest request});
}
