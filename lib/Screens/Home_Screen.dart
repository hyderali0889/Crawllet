// ignore_for_file: file_names

import 'package:crawllet/utils/Firebase_Functions.dart';
import 'package:flutter/material.dart';

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
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Center(
          child: TextButton(
              onPressed: () {
                FirebaseFunctions().signout(context);
              },
              child: Text("Hello it's Home Screen")),
        ),
      ),
    );
  }
}
