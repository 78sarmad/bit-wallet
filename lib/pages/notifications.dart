import 'package:bitcoin_wallet/utils/constants.dart';
import 'package:bitcoin_wallet/widgets/cupertino_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppColors.appBackground,
        middle: Text(
          "Notifications",
          style: TextStyle(color: Colors.black, fontSize: Fonts.pageHeadText),
        ),
        actionsForegroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            // Divider(color: Theme.of(context).accentColor),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 30, 10, 10),
              child: Text(
                "Click on the notification for more information.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.darkOrange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(),
            SizedBox(height: 10),
            CupertinoListTile(
              message: "Your transfer request is being processed.",
              icon: Icons.watch_later,
              icon_color: Colors.amber,
            ),
            CupertinoListTile(
              message: "Your transfer request has been processed.",
              icon: Icons.check_circle,
              icon_color: Colors.green,
            ),
            CupertinoListTile(
              message: "Update your profile information.",
              icon: Icons.notifications,
              icon_color: Colors.blueAccent,
            )
            // Divider(),
          ],
        ),
      ),
    );
  }
}
