// ignore_for_file: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crawllet/Screens/Home_Screen.dart';
import 'package:crawllet/Screens/Login_Screen.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:flutter/material.dart';
import 'package:ftoast/ftoast.dart';

class FirebaseFunctions {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  signup(name, email, password, context) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        value.user?.updateDisplayName(name);
        firestore.collection("${value.user!.displayName}${value.user!.uid}").add({
          "id": value.user!.uid,
          "name" : name,
          "email" : value.user!.email,
          "password": password
         });
      });
       Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false);
    } catch (e) {
      FToast.toast(context,
          msg: "An Error Occurred",
          subMsg: "Please Check You Connection and try again");
    }
  }

  login(email, password, context) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
       Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false);
    } catch (e) {
      FToast.toast(context,
          msg: "An Error Occurred",
          subMsg: "Please Check You Connection and try again");
    }
  }

  signout(context) async {
    try {
      await auth.signOut();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (route) => false);
    } catch (e) {
      FToast.toast(context,
          msg: "An Error Occurred",
          subMsg: "Please Check You Connection and try again");
    }
  }

  forgotPassword(email, context) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      FToast.toast(context, msg: "Done", subMsg: "Reset Link was sent");
      Navigator.pop(context);
    } catch (e) {
      FToast.toast(context,
          msg: "An Error Occurred",
          subMsg: "Please Check You Connection and try again");
    }
  }
}
