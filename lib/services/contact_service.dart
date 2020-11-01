import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ContactService {
  String collection;
  String uid;

  ContactService() {
    collection = "contacts";

    var firebaseUser = FirebaseAuth.instance.currentUser;
    uid = firebaseUser.uid;
  }

  void createRecord(String contactName, String contactAddress) async {
    final databaseReference = FirebaseFirestore.instance;
    await databaseReference
        .collection(collection)
        .doc(this.uid + contactName)
        .set({
      'contact_name': contactName,
      'contact_address': contactAddress,
      'user': this.uid,
    });
  }

  void updateRecord(String contactName, String contactAddress) {
    final databaseReference = FirebaseFirestore.instance;
    try {
      databaseReference
          .collection(collection)
          .doc(this.uid + contactName)
          .update({
        'contact_name': contactName,
        'contact_address': contactAddress,
        'user': this.uid,
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void deleteRecord(String contactName) {
    final databaseReference = FirebaseFirestore.instance;
    try {
      databaseReference
          .collection(collection)
          .doc(this.uid + contactName)
          .delete();
    } catch (e) {
      print(e.toString());
    }
  }
}
