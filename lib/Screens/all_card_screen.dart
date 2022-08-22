import 'package:flutter/material.dart';

import '../Theme/main_colors.dart';

class AllCards extends StatelessWidget {
  const AllCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MainColors.foregroundColor,
        body: const Center(child: Text("Hello it's All Cards Screen")));
  }
}
