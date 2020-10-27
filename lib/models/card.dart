import 'package:flutter/src/widgets/text.dart';

class Card {
  final String cardNo;
  final String cardName;
  final String cardExpiry;
  final String cardCvc;

  Card(Text text, {this.cardNo, this.cardName, this.cardExpiry, this.cardCvc});
}
