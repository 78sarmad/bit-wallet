import 'package:bitcoin_wallet/services/check_connectivity.dart';
import 'package:bitcoin_wallet/widgets/offline.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class Navigations {
  static goToScreen(BuildContext context, Widget screen) {
    Connectivity conn = new Connectivity();
    bool isConnected = conn.check();

    if (!isConnected) {
      Toast.show("Your device is offline.", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      Navigations.goToScreen(context, OfflinePage());
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
    }
  }
}
