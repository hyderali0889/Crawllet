// ignore_for_file: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crawllet/Constants/firebase_conts.dart';
import 'package:crawllet/Models/firebase_card_model.dart';
import "package:firebase_auth/firebase_auth.dart";

class FirebaseFunctions {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  signup(name, email, password) async {
    await auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      value.user?.updateDisplayName(name);
      firestore.collection(value.user!.uid).doc("User_data").set({
        "id": value.user!.uid,
        "name": name,
        "email": value.user!.email,
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

  addDatatoFirestore(CardModel model) {
    firestore.collection(auth.currentUser!.uid).doc("User_data").update({
      FirebaseConsts().cardName: model.cardName,
       FirebaseConsts().cardNum: model.cardNum,
      FirebaseConsts().cardCompany: model.cardCompany,
      FirebaseConsts().cardExp: model.cardExpiry,
      FirebaseConsts().cardVCS: model.cardVCS,
    });
  }

  getUserCardData() async{
    dynamic data = await firestore.collection(auth.currentUser!.uid).get();

    return data;
  }
}
