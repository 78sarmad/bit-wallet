import 'package:bitcoin_wallet/models/credit_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreditCardService {
  String uid;
  String collection;

  CreditCardService() {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    uid = firebaseUser.uid;
    collection = "cards";
  }

  void createRecord(
      String cardNo, String cardName, String cardExpiry, String cardCvc) async {
    final databaseReference = FirebaseFirestore.instance;
    await databaseReference.collection(collection).doc(uid).set({
      'card_no': cardNo,
      'cardholder_name': cardName,
      'card_expiry': cardExpiry,
      'card_cvc': cardCvc,
    });
  }

  void updateRecord(
      String cardNo, String cardName, String cardExpiry, String cardCvc) {
    final databaseReference = FirebaseFirestore.instance;
    try {
      databaseReference.collection(collection).doc(uid).update({
        'card_no': cardNo,
        'cardholder_name': cardName,
        'card_expiry': cardExpiry,
        'card_cvc': cardCvc,
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void deleteRecord() {
    final databaseReference = FirebaseFirestore.instance;
    try {
      databaseReference.collection(collection).doc(uid).delete();
    } catch (e) {
      print(e.toString());
    }
  }
}
