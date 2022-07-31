// ignore_for_file: file_names

import 'package:crawllet/Components/Login_Screen_Component.dart';
import 'package:crawllet/Routes/App_Routes.dart';
import 'package:crawllet/Screens/Forgot_Password_Screen.dart';
import 'package:crawllet/Screens/Signup_Screen.dart';
import 'package:crawllet/utils/Firebase_Functions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../Theme/FontSizes.dart';
import '../Theme/MainColors.dart';
import '../Theme/Spacing.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return LoginScreenComponent(mainwidget: loginScreenWidget(context));
  }
}

Widget loginScreenWidget(context) {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Size size = MediaQuery.of(context).size;
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
                  "Log In",
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
                      padding: EdgeInsets.all(Spacing.sm),
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
                      padding: EdgeInsets.fromLTRB(
                          Spacing.sm, Spacing.md, Spacing.sm, Spacing.sm),
                      child: Text(
                        "Password",
                        style: TextStyle(
                            fontFamily: "harlow",
                            fontSize: FontSizes.md,
                            color: MainColors.headingColor),
                      ),
                    ),
                    TextField(
                      obscureText: true,
                      controller: passwordController,
                      style: TextStyle(
                          fontFamily: "rockwell",
                          fontSize: FontSizes.sm,
                          color: MainColors.foregroundColor),
                      decoration: InputDecoration(
                          hintText: "Enter Password",
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
                                  width: 1, color: MainColors.foregroundColor)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14.0),
                              borderSide: BorderSide(
                                  width: 1,
                                  color: MainColors.foregroundColor))),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: Spacing.md),
                      child: Center(
                        child: TextButton(
                            onPressed: () async {
                              try {
                                if (emailController.text.isNotEmpty &&
                                    passwordController.text.isNotEmpty &&
                                    passwordController.text.length > 6) {
                                  await FirebaseFunctions().login(
                                    emailController.text.trim(),
                                    passwordController.text.trim(),
                                  );
                                  Get.offAllNamed(AppRoutes.homeScreen);
                                } else {
                                  Get.snackbar("Empty fields",
                                      "Fields are empty or password is less then 6 letters",
                                      snackPosition: SnackPosition.BOTTOM);
                                }
                              } catch (e) {
                                Get.snackbar("An Error Occurred",
                                    "Please Check You Connection and try again",
                                    snackPosition: SnackPosition.BOTTOM);
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
                                  "Log In",
                                  style: TextStyle(
                                      fontFamily: "harlow",
                                      fontSize: FontSizes.md,
                                      color: MainColors.backgroundColors),
                                )))),
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: Spacing.md),
                            alignment: Alignment.center,
                            width: size.width * 0.18,
                            height: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14.0),
                                color: MainColors.foregroundColor),
                            child: FaIcon(
                              FontAwesomeIcons.fingerprint,
                              size: FontSizes.headingSize + 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // !  Text Fields Ends Here

              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Column(
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(60, 20),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            alignment: Alignment.centerLeft),
                        onPressed: () {
                          Get.toNamed(AppRoutes.forgotPasswordScreen);
                        },
                        child: Text(
                          "Reset Password",
                          style: TextStyle(
                              fontFamily: "harlow",
                              fontSize: FontSizes.md,
                              color: MainColors.headingColor),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Not yet Signed Up ?",
                          style: TextStyle(
                              fontFamily: "harlow",
                              fontSize: FontSizes.md,
                              color: MainColors.foregroundColor),
                        ),
                        TextButton(
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(60, 20),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                alignment: Alignment.centerLeft),
                            onPressed: () {
                              Get.toNamed(AppRoutes.signupScreen);
                            },
                            child: Text(
                              " Register",
                              style: TextStyle(
                                  fontFamily: "harlow",
                                  fontSize: FontSizes.md,
                                  color: MainColors.headingColor),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
