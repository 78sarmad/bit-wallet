import 'package:bitcoin_wallet/pages/send_bitcoin_to_contact.dart';
import 'package:bitcoin_wallet/utils/constants.dart';
import 'package:flutter/material.dart';

class RecipientCard extends StatefulWidget {
  final String name;
  final String address;
  bool isSelected;

  RecipientCard(
      {@required this.name, @required this.address, this.isSelected = false});

  @override
  _ReceipientCardState createState() => _ReceipientCardState();
}

class _ReceipientCardState extends State<RecipientCard> {
  final double containerSize = 110;
  final double imageSize = 40;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.isSelected = true;
        });
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return SendBitcoinToContact(
                  contactName: widget.name, contactAddress: widget.address);
            },
          ),
        );
      },
      child: Container(
        width: containerSize,
        height: containerSize,
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
                width: widget.isSelected ? 2 : 1,
                color: widget.isSelected
                    ? AppColors.darkOrange
                    : AppColors.lightGrey2)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: imageSize,
              height: imageSize,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(imageSize / 2),
                image: DecorationImage(
                  fit: BoxFit.scaleDown,
                  image: AssetImage('assets/images/user.png'),
                ),
              ),
            ),
            Container(
              child: Text(
                widget.name,
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
