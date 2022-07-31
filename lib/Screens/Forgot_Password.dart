// ignore_for_file: file_names

import 'package:crawllet/Components/Login_Screen_Component.dart';
import 'package:crawllet/Screens/Login_Screen.dart';
import 'package:crawllet/utils/Firebase_Functions.dart';
import 'package:flutter/material.dart';
import 'package:ftoast/ftoast.dart';
import '../Theme/FontSizes.dart';
import '../Theme/MainColors.dart';
import '../Theme/Spacing.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return LoginScreenComponent(mainwidget: signUpScreenWidget(context));
  }
}

Widget signUpScreenWidget(context) {
  Size size = MediaQuery.of(context).size;
  TextEditingController emailController = TextEditingController();
  return Column(
    children: [
      SizedBox(
        width: size.width,
        height: size.height * 0.3,
        child: Column(
          children: [
            Center(
              child: Text(
                "Wallet App",
                style: TextStyle(
                    fontFamily: "harlow",
                    fontSize: FontSizes.lg,
                    color: MainColors.textColor),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Spacing.xxl),
              child: Center(
                child: Text(
                  "Reset Password",
                  style: TextStyle(
                      fontFamily: "harlow",
                      fontSize: FontSizes.headingSize,
                      color: MainColors.drawingFillColor),
                ),
              ),
            ),
          ],
        ),
      ),
      Expanded(
        child: Padding(
          padding: EdgeInsets.only(top: Spacing.md),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // !  Text Fields Starts Here
              SizedBox(
                width: size.width * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          Spacing.sm, Spacing.md, Spacing.sm, Spacing.sm),
                      child: Text(
                        "Email",
                        style: TextStyle(
                            fontFamily: "harlow",
                            fontSize: FontSizes.sm,
                            color: MainColors.headingColor),
                      ),
                    ),
                    TextField(
                      controller: emailController,
                      style: TextStyle(
                          fontFamily: "rockwell",
                          fontSize: FontSizes.md,
                          color: MainColors.foregroundColor),
                      decoration: InputDecoration(
                          hintText: "Enter Email",
                          hintStyle: TextStyle(
                              fontFamily: "rockwell",
                              fontSize: FontSizes.sm,
                              color:
                                  MainColors.foregroundColor.withOpacity(0.5)),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: Spacing.sm),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14.0),
                              borderSide: BorderSide(
                                  color: MainColors.foregroundColor)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14.0),
                              borderSide: BorderSide(
                                  color: MainColors.foregroundColor))),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: Spacing.md),
                      child: Center(
                        child: TextButton(
                            onPressed: () {
                              if (emailController.text.isNotEmpty) {
                                FirebaseFunctions().forgotPassword(
                                    emailController.text.trim(), context);
                              } else {
                                FToast.toast(context, msg: "Empty Field");
                              }
                            },
                            child: Container(
                                width: size.width * 0.7,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14.0),
                                    color: MainColors.foregroundColor),
                                child: Center(
                                    child: Text(
                                  "Send Link",
                                  style: TextStyle(
                                      fontFamily: "harlow",
                                      fontSize: FontSizes.md,
                                      color: MainColors.backgroundColors),
                                )))),
                      ),
                    ),
                  ],
                ),
              ),

              // !  Text Fields Ends Here
            ],
          ),
        ),
      ),
    ],
  );
}
