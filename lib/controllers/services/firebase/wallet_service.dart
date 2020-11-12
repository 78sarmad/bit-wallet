import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WalletService {
  String uid;
  String collection;

  WalletService() {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    uid = firebaseUser.uid;
    collection = "wallets";
  }

  void createRecord(String walletAddress, String walletPassword) async {
    final databaseReference = FirebaseFirestore.instance;
    await databaseReference.collection(collection).doc(uid).set({
      'wallet_address': walletAddress,
      'wallet_password': walletPassword,
    });
  }

  void updateRecord(String walletAddress, String walletPassword) {
    final databaseReference = FirebaseFirestore.instance;
    try {
      databaseReference.collection(collection).doc(uid).update({
        'wallet_address': walletAddress,
        'wallet_password': walletPassword,
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
