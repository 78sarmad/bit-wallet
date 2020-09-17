import 'package:bitcoin_wallet/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NairaOrangeBox extends StatelessWidget {
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
              gradient: LinearGradient(colors: [AppColors.darkOrange, AppColors.lightOrange]),
              borderRadius: BorderRadius.circular(10.0)
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: SvgPicture.asset("assets/images/naira_large.svg",
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
                              border: Border.all(color: Colors.white)
                            ) ,
                            child: Center(
                              child: SvgPicture.asset("assets/images/naira_white.svg",
                                
                              ),
                            ),
                          ),
                          Container(
                            child: Text("Nigerian Naira (NGN)",
                              style: TextStyle(color: Colors.white), 
                            ),
                          )
                        ]  ,
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text("₦ 15,000",
                              style: TextStyle(color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ), 
                            ),
                          ),
                          Container(
                            child: Text("0.09BTC",
                              style: TextStyle(color: Colors.white,
                                fontSize: 14
                              ), 
                            ),
                          )
                        ]  ,
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