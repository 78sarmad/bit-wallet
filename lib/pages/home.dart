import 'package:bitcoin_wallet/pages/buy_bitcoin.dart';
import 'package:bitcoin_wallet/pages/edit_profile.dart';
import 'package:bitcoin_wallet/pages/notifications.dart';
import 'package:bitcoin_wallet/pages/payment.dart';
import 'package:bitcoin_wallet/pages/receive_bitcoin.dart';
import 'package:bitcoin_wallet/pages/send_bitcoin.dart';
import 'package:bitcoin_wallet/pages/splash.dart';
import 'package:bitcoin_wallet/pages/withdraw_to_bank.dart';
import 'package:bitcoin_wallet/pages/withdraw_to_naira.dart';
import 'package:bitcoin_wallet/services/auth_service.dart';
import 'package:bitcoin_wallet/utils/constants.dart';
import 'package:bitcoin_wallet/utils/navigations.dart';
import 'package:bitcoin_wallet/widgets/custom_cupertino_icon.dart';
import 'package:bitcoin_wallet/widgets/notification_badge.dart';
import 'package:bitcoin_wallet/widgets/transaction_history_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toast/toast.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();

  String name, email;
  Home({Key key, this.name, this.email}) : super(key: key);
}

class _HomeState extends State<Home> {
  final GlobalKey<InnerDrawerState> _innerDrawerKey =
      GlobalKey<InnerDrawerState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double imageSize = 60;
    // final _authCubit = context.bloc<AuthCubit>();

    return InnerDrawer(
      key: _innerDrawerKey,
      leftChild: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [AppColors.darkOrange, AppColors.lightOrange])),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => EditProfilePage(
                          name: widget.name, email: widget.email)));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: imageSize,
                      height: imageSize,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(imageSize / 2),
                      ),
                      child: Image(image: AssetImage('assets/images/user.png')),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Text(
                        widget.name,
                        style: TextStyle(color: Colors.white, fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: FlatButton(
                onPressed: () {
                  _innerDrawerKey.currentState.toggle();
                  Navigations.goToScreen(context, WithdrawToNaira());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.monetization_on,
                      size: 32,
                      color: AppColors.lightOrange,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Withdraw to Naira",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: FlatButton(
                onPressed: () {
                  _innerDrawerKey.currentState.toggle();
                  Navigations.goToScreen(context, WithdrawToBank());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.account_balance,
                      size: 32,
                      color: AppColors.lightOrange,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Withdraw to Bank",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: FlatButton(
                onPressed: () {
                  _innerDrawerKey.currentState.toggle();
                  Navigations.goToScreen(context, BuyBitcoin());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.credit_card,
                      size: 32,
                      color: AppColors.lightOrange,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Buy Bitcoin",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 10),
                  height: 1,
                  color: AppColors.lightGrey,
                ))
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: FlatButton(
                onPressed: () async {
                  _innerDrawerKey.currentState.toggle();
                  Navigations.goToScreen(context, Payment());
                  // _authCubit.logoutUser();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.credit_card,
                      size: 32,
                      color: AppColors.lightOrange,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Manage Credit Card",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: FlatButton(
                onPressed: () async {
                  _innerDrawerKey.currentState.toggle();
                  await signOut();
                  await checkAuth();
                  Toast.show("Signing out...", context,
                      duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return SplashScreen();
                      },
                    ),
                  );
                  // _authCubit.logoutUser();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.close,
                      size: 32,
                      color: AppColors.lightOrange,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Sign out",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      backgroundDecoration: BoxDecoration(color: AppColors.appBackground),
      onTapClose: true,
      scaffold: CupertinoPageScaffold(
        backgroundColor: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    height: 200,
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      AppColors.darkOrange,
                      AppColors.lightOrange
                    ])),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _innerDrawerKey.currentState.toggle();
                          },
                          child: CustomCupertinoIcon(
                              iconCode: 0xF394, color: Colors.white),
                        ),
                        Container(
                          child: Text(
                            "Your account",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigations.goToScreen(context, Notifications());
                          },
                          child: Container(
                            child: NotificationBadge(),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    left: 10,
                    right: 10,
                    bottom: -20,
                    child: Center(
                      child: Container(
                        width: screenWidth * 0.8,
                        child: Stack(
                          children: [
                            Container(
                              // width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    AppColors.lightBlue,
                                    AppColors.darkBlue
                                  ]),
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
                                    margin: const EdgeInsets.only(
                                        left: 10, right: 10, top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  color: AppColors.darkBlue,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  border: Border.all(
                                                      color: Colors.white)),
                                              child: Center(
                                                child: SvgPicture.asset(
                                                  "assets/images/bit_white.svg",
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                "Bitcoin (BTC)",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Text(
                                                "\$9054.32",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                "0.09BTC",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 10, right: 10, top: 30),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    colors: [
                                                  AppColors.darkOrange,
                                                  AppColors.lightOrange
                                                ])),
                                            child: FlatButton(
                                                onPressed: () {
                                                  Navigations.goToScreen(
                                                      context, SendBitcoin());
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    CustomCupertinoIcon(
                                                        iconCode: 0xF473,
                                                        color: Colors.white),
                                                    Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              left: 10),
                                                      child: Text(
                                                        "Send",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    )
                                                  ],
                                                )),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    colors: [
                                                  AppColors.darkOrange,
                                                  AppColors.lightOrange
                                                ])),
                                            child: FlatButton(
                                                onPressed: () {
                                                  Navigations.goToScreen(
                                                      context,
                                                      ReceiveBitcoin());
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    CustomCupertinoIcon(
                                                        iconCode: 0xF2C9,
                                                        color: Colors.white),
                                                    Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              left: 10),
                                                      child: Text(
                                                        "Receive",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    )
                                                  ],
                                                )),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 35),
                child: Text(
                  "Transaction History",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                  child: ListView(
                padding: const EdgeInsets.only(left: 15, right: 15),
                shrinkWrap: true,
                children: [
                  TransactionHistoryRow(
                    name: "Khalid Navabi",
                    time: "Yesterday",
                    image: "",
                    amount: "\$998",
                  ),
                  TransactionHistoryRow(
                    name: "Ethereum",
                    time: "14:20 12 Apr",
                    image: "",
                    amount: "\$100",
                  ),
                  TransactionHistoryRow(
                    name: "Sidney Cole",
                    time: "13:39 16 July",
                    image: "",
                    amount: "\$450",
                  ),
                  TransactionHistoryRow(
                    name: "Evangeline Lily",
                    time: "14:20 12 Apr",
                    image: "",
                    amount: "\$1000",
                  ),
                  TransactionHistoryRow(
                    name: "James Corden",
                    time: "13:39 16 July",
                    image: "",
                    amount: "\$450",
                  ),
                  TransactionHistoryRow(
                    name: "Rajesh Kumar",
                    time: "14:20 12 Apr",
                    image: "",
                    amount: "\$1000",
                  ),
                  TransactionHistoryRow(
                    name: "Khalid Navabi",
                    time: "Yesterday",
                    image: "",
                    amount: "\$998",
                  ),
                  TransactionHistoryRow(
                    name: "Ethereum",
                    time: "14:20 12 Apr",
                    image: "",
                    amount: "\$100",
                  ),
                  TransactionHistoryRow(
                    name: "Sidney Cole",
                    time: "13:39 16 July",
                    image: "",
                    amount: "\$450",
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
