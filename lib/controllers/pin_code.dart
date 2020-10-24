import 'package:bitcoin_wallet/services/local_service.dart';

int pressCount = 0;

void incrementPressCount() {
  pressCount++;
}

void resetPressCount() {
  pressCount = 0;
}

int getPressCount() {
  return (pressCount);
}

String pinCode = "";
String pinCodeKey = "pin_code";
bool checkSet = true;
bool checkMatch = false;

void grabPinDigits(String digit) {
  pinCode += digit;
}

String getPinCode() {
  return (pinCode);
}

void resetPinCode() {
  pinCode = "";
}

void savePinCode() async {
  await saveLocalData(pinCodeKey, pinCode);
}

void checkPinSet() async {
  final pin = await getLocalData(pinCodeKey);
  if (pin == "null") checkSet = false;
}

bool isPinSet() {
  checkPinSet();
  return (checkSet);
}

void resetPinSet() {
  checkSet = true;
}

void checkPinMatch() async {
  final pin = await getLocalData(pinCodeKey);
  if (pin.toString() == pinCode) checkMatch = true;
}

bool isPinMatched() {
  checkPinMatch();
  return (checkMatch);
}

void resetPinMatch() {
  checkMatch = false;
}

void resetAll() {
  resetPressCount();
  resetPinCode();
  resetPinSet();
  resetPinMatch();
}
