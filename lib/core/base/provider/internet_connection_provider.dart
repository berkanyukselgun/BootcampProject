import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

enum ConnectionStatus { CONNECTED, DISCONNECTED, UNKNOWN }

class InternetConnectionProvider extends ChangeNotifier {
  ConnectionStatus _connectionStatus = ConnectionStatus.UNKNOWN;
  ConnectionStatus get connectionStatus => _connectionStatus;

  Future<void> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      _connectionStatus = ConnectionStatus.DISCONNECTED;
    } else {
      _connectionStatus = ConnectionStatus.CONNECTED;
    }
    notifyListeners();
  }
}
