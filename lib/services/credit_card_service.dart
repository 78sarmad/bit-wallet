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

  CreditCard getData() {
    CreditCard card;
    final databaseReference = FirebaseFirestore.instance;
    databaseReference
        .collection(collection)
        .get()
        .then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((f) {
        String no = f.data().values.elementAt(0);
        String cvc = f.data().values.elementAt(1);
        String name = f.data().values.elementAt(2);
        String exp = f.data().values.elementAt(3);
        card = new CreditCard(
            cardNo: no, cardName: name, cardExpiry: exp, cardCvc: cvc);
      });
    });
    return card;
  }

  void updateData(
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

  void deleteData() {
    final databaseReference = FirebaseFirestore.instance;
    try {
      databaseReference.collection(collection).doc(uid).delete();
    } catch (e) {
      print(e.toString());
    }
  }
}
