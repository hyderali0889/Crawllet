// ignore_for_file: file_names

import 'package:crawllet/Routes/App_Routes.dart';
import 'package:crawllet/Screens/GetStartedScreen.dart';
import 'package:crawllet/Theme/FontSizes.dart';
import 'package:crawllet/Theme/MainColors.dart';
import 'package:crawllet/objectbox.g.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:get/get.dart';
import '../main.dart';
import '../models/isUserStarted.dart';
import 'Login_Screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Box<IsUserStarted> isUserStarted = objectBox.store.box<IsUserStarted>();

  @override
  void initState() {
    super.initState();
    getIsUserStarted();
  }

  getIsUserStarted() {
    try {
      var userStarted = isUserStarted.get(1)?.userStarted ?? false;
      if (userStarted == true) {
        Future.delayed(const Duration(milliseconds: 2500), () {
          Get.offAll(() => const LoginScreen());
        });
      } else {
        Future.delayed(const Duration(milliseconds: 2500), () {
          Get.offAll(() => const GetStartedScreen());
        });
      }
    } catch (e) {
      Get.snackbar("An Error Occurred", "$e");

      Get.offAllNamed(AppRoutes.loginScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: MainColors.boxFillColor,
        width: size.width,
        height: size.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child:
                  Image.asset("assets/icons/main.png", height: 100, width: 100),
            ),
            SizedBox(
              width: size.width * 0.7,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text("Welcome to",
                          style: TextStyle(
                            fontFamily: 'rockwell',
                            fontSize: FontSizes.md,
                            color: Colors.white,
                          )),
                    ),
                    DefaultTextStyle(
                      style: TextStyle(
                          fontSize: FontSizes.lg,
                          fontFamily: 'rockwell',
                          color: MainColors.headingColor),
                      child: AnimatedTextKit(
                        isRepeatingAnimation: false,
                        animatedTexts: [
                          TypewriterAnimatedText(
                              'Crawllet \n The Best Wallet App.'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
