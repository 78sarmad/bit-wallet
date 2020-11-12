class Price {
  String base;
  String currency;
  String amount;

  Price({this.base, this.currency, this.amount});

  Price.fromJson(Map<String, dynamic> json) {
    base = json['base'];
    currency = json['currency'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['base'] = this.base;
    data['currency'] = this.currency;
    data['amount'] = this.amount;
    return data;
  }
}
