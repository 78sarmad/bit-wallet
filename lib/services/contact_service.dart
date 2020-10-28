import 'package:cloud_firestore/cloud_firestore.dart';

class ContactService {
  String collection;

  ContactService() {
    collection = "contacts";
  }

  void createRecord(String contactName, String contactAddress) async {
    final databaseReference = FirebaseFirestore.instance;
    await databaseReference
        .collection(collection)
        .doc(contactName)
        .set({'contact_name': contactName, 'contact_address': contactAddress});
  }

  void updateData(String contactName, String contactAddress) {
    final databaseReference = FirebaseFirestore.instance;
    try {
      databaseReference.collection(collection).doc(contactName).update(
          {'contact_name': contactName, 'contact_address': contactAddress});
    } catch (e) {
      print(e.toString());
    }
  }

  void deleteData(String contactName) {
    final databaseReference = FirebaseFirestore.instance;
    try {
      databaseReference.collection(collection).doc(contactName).delete();
    } catch (e) {
      print(e.toString());
    }
  }
}
