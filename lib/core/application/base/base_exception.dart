class BaseException {
  final String message;
  final String? code;

  const BaseException(this.message, {this.code});

  @override
  String toString() {
    return 'BaseException{message: $message, code: $code}';
  }
}
