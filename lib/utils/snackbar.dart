import 'package:bitcoin_wallet/utils/navigations.dart';
import 'package:flutter/cupertino.dart';

class InfoScreen extends StatefulWidget {
  final String msg;
  final IconData icon;
  final Widget screen;

  InfoScreen({this.msg, this.icon, this.screen});

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          children: [
            Icon(widget.icon),
            SizedBox(width: 10),
            Text(widget.msg),
          ],
        ),
      ),
    );
  }

  void navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 5), () => "1");
    Navigations.goToScreen(context, widget.screen);
  }
}
