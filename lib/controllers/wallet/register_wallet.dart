import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:bitcoin_wallet/models/podos/price.dart';

Future<Price> registerWallet() async {
  Price result;
  String link = "https://api.coinbase.com/v2/prices/BTC-USD/spot";
  var res = await http
      .get(Uri.encodeFull(link), headers: {"Accept": "application/json"});
  if (res.statusCode == 200) {
    var data = json.decode(res.body);
    var rest = data["data"];
    result = Price.fromJson(rest);
  }
  return result;
}
