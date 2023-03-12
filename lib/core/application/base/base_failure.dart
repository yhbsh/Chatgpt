class BaseFailure {
  final String message;

  const BaseFailure({required this.message});

  const BaseFailure.noInternetConnection() : message = 'No internet connection';

  @override
  String toString() {
    return 'BaseFailure{message: $message}';
  }
}
