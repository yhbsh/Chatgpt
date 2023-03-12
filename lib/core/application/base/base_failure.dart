class BaseFailure {
  final String message;

  const BaseFailure({required this.message});

  @override
  String toString() {
    return 'BaseFailure{message: $message}';
  }
}
