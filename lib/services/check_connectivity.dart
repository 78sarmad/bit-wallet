import 'package:flutter_offline/flutter_offline.dart';

class Connectivity {
  ConnectivityResult connectivity;

  bool check() {
    final bool connected = connectivity != ConnectivityResult.none;
    return connected;
  }
}
