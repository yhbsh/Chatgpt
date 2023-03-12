import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/core.dart';
import '../../../domain/domain.dart';

part 'chat_completion_state.freezed.dart';

@freezed
class ChatCompletionState with _$ChatCompletionState {
  // initial state
  const factory ChatCompletionState.notRequested() = NotRequested;

  // loading state
  const factory ChatCompletionState.requested() = Requested;

  // success state
  const factory ChatCompletionState.success({required ChatCompletionMessageEntity message}) = Success;

  // failure state
  const factory ChatCompletionState.failure({required BaseFailure failure}) = Failure;
}
