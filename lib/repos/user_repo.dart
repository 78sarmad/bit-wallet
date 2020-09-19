import 'package:bitcoin_wallet/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserRepo {
  final _firebaseAuth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  
  String getCurrentUserEmail(){
    return _firebaseAuth.currentUser.email;
  }

  Future<AppUser> getCurrentUserProfile() async{
    final email = getCurrentUserEmail();
    final docSnapshot = await _firestore.collection("users").doc(email).get();
    return AppUser.fromMap(docSnapshot.data());
  }

  Future<AppUser> getUserProfile(String email) async{
    final docSnapshot = await _firestore.collection("users").doc(email).get();
    return AppUser.fromMap(docSnapshot.data());
  }

  Stream<DocumentSnapshot> getCurrentUserAsStream(){
    final email = getCurrentUserEmail();
    return _firestore.collection("users").doc(email).snapshots();
  }

  Stream<DocumentSnapshot> getUserAsStream(String email){
    return _firestore.collection("users").doc(email).snapshots();
  }

  Future<void> createUserProfile ({@required AppUser user}) async{
    await _firestore.collection("users").doc(user.email).set(user.toMap());
  }

  Future<void> registerUser({@required String email, @required String password}) async{
    await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> loginUser({@required String email, @required String password}) async{
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> logoutUser(){
    _firebaseAuth.signOut();
  }

  Future<void> updateProfileImage({@required String profileImage}) async{
    final email = getCurrentUserEmail();
    await _firestore.collection("users").doc(email)
    .set({"profileImage" : profileImage}, SetOptions(merge: true));
  }

  bool isSignedIn() {
    return _firebaseAuth.currentUser != null;
  }

}