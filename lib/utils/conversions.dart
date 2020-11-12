import 'package:bitcoin_wallet/controllers/apis/coinbase.dart';

Future<double> convertBTCtoUSD(double btcAmount) async {
  final btcPrice = await getSpotPrice();
  final price = (btcAmount * double.parse(btcPrice.amount));
  return price;
}

Future<double> convertBTCtoNaira(double btcAmount) async {
  final btcPrice = await getSpotPrice();
  final price = (btcAmount * double.parse(btcPrice.amount) * 381.20);
  return price;
}

Future<double> convertUSDtoBTC(double usdAmount) async {
  final btcPrice = await getSpotPrice();
  final price = (usdAmount / double.parse(btcPrice.amount));
  return price;
}
