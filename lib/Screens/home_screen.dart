// ignore_for_file: file_names

import 'package:crawllet/Components/main_component.dart';
import 'package:crawllet/Routes/app_routes.dart';
import 'package:crawllet/Theme/main_colors.dart';
import 'package:crawllet/utils/firebase_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: MainColors.foregroundColor,
      body: MainComponent(
        widget: Column(
          children: [
            Center(
              child: TextButton(
                  onPressed: () {
                    FirebaseFunctions().signout();

                    Get.offAllNamed(AppRoutes.loginScreen);
                  },
                  child: const Text("Hello it's Home Screen")),
            ),
          ],
        ),
      ),
    );
  }
}
