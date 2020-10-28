class CreditCard {
  final String cardNo;
  final String cardName;
  final String cardExpiry;
  final String cardCvc;

  CreditCard({this.cardNo, this.cardName, this.cardExpiry, this.cardCvc});

  CreditCard.fromJson(Map<String, dynamic> json)
      : cardNo = json['card_no'],
        cardName = json['cardholder_name'],
        cardExpiry = json['card_expiry'],
        cardCvc = json['card_cvc'];

  Map<String, dynamic> toJson() => {
        'card_no': cardNo,
        'cardholder_name': cardName,
        'card_expiry': cardExpiry,
        'card_cvc': cardCvc
      };
}
