import 'package:cloud_firestore/cloud_firestore.dart';

class CardDbService {
  final String uid;
  final String collection = "cards";

  CardDbService({this.uid});

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

  List getData() {
    final databaseReference = FirebaseFirestore.instance;
    List cardInfo = new List();
    databaseReference
        .collection(collection)
        .get()
        .then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((f) => cardInfo.add(f.data));
    });
    return (cardInfo);
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
