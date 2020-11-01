import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRImageWidget extends StatelessWidget {
  String data;

  QRImageWidget({this.data});

  @override
  Widget build(BuildContext context) {
    return QrImage(
      data: "Bitcoin Address: " + this.data,
      version: QrVersions.auto,
      size: 120,
      gapless: false,
    );
  }
}
