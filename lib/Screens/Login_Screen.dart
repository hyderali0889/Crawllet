// ignore_for_file: file_names

import 'package:crawllet/Components/Login_Screen_Component.dart';
import 'package:flutter/material.dart';
import 'package:icon_forest/don_icons.dart';

import '../Theme/FontSizes.dart';
import '../Theme/MainColors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return LoginScreenComponent(mainwidget: loginScreenWidget());
  }
}

Widget loginScreenWidget() {
  return Column(
    children: [
      Row(
        children: [
          Icon(DonIcons.arrow_left),
          Text(
            "Wallet Ap",
            style: TextStyle(
                fontFamily: "harlow",
                fontSize: FontSizes.lg,
                color: MainColors.textColor),
          )
        ],
      )
    ],
  );
}
