
import 'package:crawllet/Theme/main_colors.dart';
import 'package:flutter/material.dart';

class CryptoRatesScreen extends StatelessWidget {
  const CryptoRatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.foregroundColor ,
      body:  const Center(child: Text("Hello it's Crypto Screen")));
  }
}