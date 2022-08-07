
import 'package:flutter/material.dart';

import '../Theme/main_colors.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.foregroundColor ,

      body:Center(child: Text("Hello it's About Screen")));
  }
}