class BaseException {
  final String message;
  final String? code;

  const BaseException({required this.message, this.code});

  const BaseException.serverError()
      : message = 'Server error',
        code = 'SERVER_ERROR';

  @override
  String toString() {
    return 'BaseException{message: $message, code: $code}';
  }
}
