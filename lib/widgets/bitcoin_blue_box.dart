import 'package:bitcoin_wallet/controllers/coinbase/get_price.dart';
import 'package:bitcoin_wallet/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BitcoinBlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            // width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [AppColors.lightBlue, AppColors.darkBlue]),
                borderRadius: BorderRadius.circular(10.0)),
            child: Align(
              alignment: Alignment.topLeft,
              child: SvgPicture.asset(
                "assets/images/bit.svg",
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                color: AppColors.darkBlue,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.white)),
                            child: Center(
                              child: SvgPicture.asset(
                                "assets/images/bit_white.svg",
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              "Bitcoin (BTC)",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            alignment: Alignment.topRight,
                            child: FutureBuilder(
                                future: getSellPrice(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Container(
                                      child: Text(
                                        "\$ " + snapshot.data.amount,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    );
                                  } else {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  }
                                }),
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            child: Text(
                              "1 BTC",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
