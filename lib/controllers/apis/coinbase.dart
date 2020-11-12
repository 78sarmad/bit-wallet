import 'dart:async';
import 'dart:convert';

import 'package:bitcoin_wallet/models/bitcoin_price.dart';
import 'package:http/http.dart' as http;

Future<Price> getSpotPrice() async {
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

Future<Price> getBuyPrice() async {
  Price result;
  String link = "https://api.coinbase.com/v2/prices/BTC-USD/buy";
  var res = await http
      .get(Uri.encodeFull(link), headers: {"Accept": "application/json"});
  if (res.statusCode == 200) {
    var data = json.decode(res.body);
    var rest = data["data"];
    result = Price.fromJson(rest);
  }
  return result;
}

Future<Price> getSellPrice() async {
  Price result;
  String link = "https://api.coinbase.com/v2/prices/BTC-USD/sell";
  var res = await http
      .get(Uri.encodeFull(link), headers: {"Accept": "application/json"});
  if (res.statusCode == 200) {
    var data = json.decode(res.body);
    var rest = data["data"];
    result = Price.fromJson(rest);
  }
  return result;
}
