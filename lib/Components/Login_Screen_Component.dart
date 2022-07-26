// ignore_for_file: file_names

import 'package:crawllet/Theme/MainColors.dart';
import 'package:flutter/material.dart';

class LoginScreenComponent extends StatefulWidget {
  final Widget mainwidget;
  const LoginScreenComponent({Key? key, required this.mainwidget})
      : super(key: key);

  @override
  State<LoginScreenComponent> createState() => _LoginScreenComponentState();
}

class _LoginScreenComponentState extends State<LoginScreenComponent> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData data = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: MainColors.backgroundColors,
      body: SizedBox(
        width: data.size.width,
        height: data.size.height,
        child: Stack(children: [
          CustomPaint(
            size: Size(900, 500),
            painter: RPSCustomPainter(),
          ),
          Padding(
              padding: EdgeInsets.only(top: data.viewPadding.top),
              child: widget.mainwidget)
        ]),
      ),
    );
  }
}

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = MainColors.backgroundColors;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(0, 225);
    path_1.lineTo(37.5, 233);
    path_1.cubicTo(75, 241, 150, 257, 225, 266);
    path_1.cubicTo(300, 275, 375, 277, 450, 261.5);
    path_1.cubicTo(525, 246, 600, 213, 675, 219.7);
    path_1.cubicTo(750, 226.3, 825, 272.7, 862.5, 295.8);
    path_1.lineTo(900, 319);
    path_1.lineTo(900, 0);
    path_1.lineTo(862.5, 0);
    path_1.cubicTo(825, 0, 750, 0, 675, 0);
    path_1.cubicTo(600, 0, 525, 0, 450, 0);
    path_1.cubicTo(375, 0, 300, 0, 225, 0);
    path_1.cubicTo(150, 0, 75, 0, 37.5, 0);
    path_1.lineTo(0, 0);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = MainColors.foregroundColor;
    canvas.drawPath(path_1, paint_1_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
