import 'package:bitcoin_wallet/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionHistoryRow extends StatelessWidget {
  final String name;
  final String image;
  final String time;
  final String amount;

  TransactionHistoryRow({this.name, this.image, this.time, this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/images/user.png'),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: Text(name),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        child: Text(
                          time,
                          style: TextStyle(
                              color: AppColors.lightGrey, fontSize: 15),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: Text(
                      amount,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Icon(
                    CupertinoIcons.right_chevron,
                    color: AppColors.lightGrey,
                  )
                ],
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 15),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  color: AppColors.lightGrey.withOpacity(0.3),
                  height: 2,
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
