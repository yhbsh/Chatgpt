import 'dart:io';

abstract class INetowrkInfo {
  Future<bool> get isConnected;
}

class NetworkInfo implements INetowrkInfo {
  @override
  Future<bool> get isConnected async {
    try {
      final response = await InternetAddress.lookup('google.com');
      if (response.isNotEmpty && response[0].rawAddress.isNotEmpty) {
        return true;
      }

      return false;
    } on SocketException catch (_) {
      return false;
    }
  }
}
