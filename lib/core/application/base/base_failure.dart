class BaseFailure {
  final String message;

  const BaseFailure({required this.message});

  const BaseFailure.noInternetConnection() : message = 'No internet connection';

  const BaseFailure.unexpected() : message = 'Unexpected error';

  @override
  String toString() {
    return 'BaseFailure{message: $message}';
  }
}
