import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:toast/toast.dart';

Future<bool> checkAuth() async {
  await Firebase.initializeApp();

  FirebaseAuth auth = FirebaseAuth.instance;
  if (auth.currentUser != null) {
    print("Already Signed in");
    return true;
  } else {
    print("Signed Out");
    return false;
  }
}

Future<void> signUp(String name, String email, String password) async {
  await Firebase.initializeApp();

  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    User user = FirebaseAuth.instance.currentUser ?? "null";
    user.updateProfile(displayName: name);
    print("Success");
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e.toString());
  }
}

Future<void> signIn(String email, String password) async {
  await Firebase.initializeApp();
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    print("Success");
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    } else {
      print(e.code.toString());
    }
  }
}

Future<void> signOut() async {
  await Firebase.initializeApp();

  try {
    await FirebaseAuth.instance.signOut();
    print("Success");
  } catch (e) {
    print(e.toString());
  }
}

Future<void> resetPassword(String email) async {
  await Firebase.initializeApp();

  await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
}

Future<void> verifyEmail() async {
  await Firebase.initializeApp();

  User user = FirebaseAuth.instance.currentUser;
  user.sendEmailVerification();
}

Future<void> setName(String name) async {
  await Firebase.initializeApp();

  User user = FirebaseAuth.instance.currentUser;
  user.updateProfile(displayName: name);
}

Future<void> setEmail(String email) async {
  await Firebase.initializeApp();

  User user = FirebaseAuth.instance.currentUser;
  user.updateEmail(email);
}

Future<void> setPassword(String password) async {
  await Firebase.initializeApp();

  User user = FirebaseAuth.instance.currentUser;
  user.updatePassword(password);
}

Future<String> checkDisplayName() async {
  await Firebase.initializeApp();

  User user = FirebaseAuth.instance.currentUser;
  print(user.displayName);
  return (user.displayName);
}

Future<String> checkDisplayEmail() async {
  await Firebase.initializeApp();

  User user = FirebaseAuth.instance.currentUser;
  print(user.email);
  return (user.email);
}
