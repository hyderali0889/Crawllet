// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFFF15BB5);

    const colors = [
      Color(0xFFFEE440),
      Color(0xFF00BBF9),
    ];

    const durations = [
      5000,
      4000,
    ];

    const heightPercentages = [
      0.65,
      0.66,
    ];
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
          width: size.width,
          height: size.height,
          child: Container(
            child: WaveWidget(
              config: CustomConfig(
                colors: colors,
                durations: durations,
                heightPercentages: heightPercentages,
              ),
              backgroundColor: backgroundColor,
              size: Size(double.infinity, double.infinity),
              waveAmplitude: 0,
            ),
          )),
    );
  }
}
