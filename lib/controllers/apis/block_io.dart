import 'dart:async';
import 'dart:convert';

import 'package:bitcoin_wallet/models/bitcoin_price.dart';
import 'package:bitcoin_wallet/utils/constants.dart';
import 'package:http/http.dart' as http;

Future<Price> getWalletDetails(String email) async {
  Price result;
  String link =
      "https://block.io/api/v2/get_address_by/?api_key=${Keys.apiKey}&label=${email}";
  var res = await http
      .get(Uri.encodeFull(link), headers: {"Accept": "application/json"});
  if (res.statusCode == 200) {
    var data = json.decode(res.body);
    var rest = data["data"];
    result = Price.fromJson(rest);
  }
  return result;
}
