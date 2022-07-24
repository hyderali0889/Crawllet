// ignore_for_file: file_names

import 'package:crawllet/Screens/GetStartedScreen.dart';
import 'package:crawllet/Theme/FontSizes.dart';
import 'package:crawllet/Theme/MainColors.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    if (!mounted) {
      Future.delayed(const Duration(milliseconds: 1500), () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const GetStartedScreen()));
      });
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
          child: Center(
            child: Row(
              children: [
                Image.asset("assets/icons/main.png"),
                Column(
                  children: [
                    Text(
                      "Welcome to",
                      style: TextStyle(
                          fontFamily: 'rockwell', fontSize: FontSizes.md),
                    ),
                    SizedBox(
                      width: size.width * 0.9,
                      child: DefaultTextStyle(
                        style: TextStyle(
                          fontSize: FontSizes.md,
                          fontFamily: 'rockwell',
                        ),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                                'Crawllet, The Best Wallet App.'),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
