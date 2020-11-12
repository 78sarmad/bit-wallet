import 'package:bitcoin_wallet/controllers/services/local/local_service.dart';

class PinCode {
  String pinCode = "";
  String pinCodeKey = "pin_code";
  bool checkSet = false;
  bool checkMatch = false;

  void grabPinDigits(String digit) {
    pinCode += digit;
    print("grabdigit: " + pinCode);
  }

  String getPinCode() {
    print(pinCode);
    return (pinCode);
  }

  void savePinCode() async {
    print(pinCode);
    await saveLocalData(pinCodeKey, pinCode);
  }

  Future<void> checkPinSet() async {
    final pin = await getLocalData(pinCodeKey);
    if (pin != "null") checkSet = true;
  }

  bool isPinSet() {
    return checkSet;
  }

  void resetPinCode() {
    pinCode = "";
    print("--> resetPinCode");
  }

  Future<void> checkPinMatch() async {
    final pin = await getLocalData(pinCodeKey);
    print("saved pin: " + pin);
    print("input pin: " + pinCode);
    print("checkPinMatch equal?");
    print(pinCode == pin.toString());

    if (pin.toString() == pinCode) checkMatch = true;
  }

  bool isPinMatched() {
    return checkMatch;
  }

  void resetPinSet() {
    checkSet = false;
    print("--> reset pin set");
  }

  void resetPinMatch() {
    checkMatch = false;
    print("--> reset pin match");
  }

  void resetAll() {
    resetPinCode();
    resetPinSet();
    resetPinMatch();
  }
}
