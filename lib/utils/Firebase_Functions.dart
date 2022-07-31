// ignore_for_file: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:firebase_auth/firebase_auth.dart";


class FirebaseFunctions {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  signup(name, email, password) async {
    await auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      value.user?.updateDisplayName(name);
      firestore.collection("${value.user!.displayName}${value.user!.uid}").add({
        "id": value.user!.uid,
        "name": name,
        "email": value.user!.email,
        "password": password
      });
    });
  }

  login(email, password) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);

  }

  signout() async {
    await auth.signOut();

  }

  forgotPassword(email) async {
    await auth.sendPasswordResetEmail(email: email);
  }
}
