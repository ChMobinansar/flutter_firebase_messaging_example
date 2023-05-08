import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../utils/custom_colors.dart';
import '../utils/custom_textstyle.dart';

class MyArc extends StatelessWidget {
  final double diameter;
  const MyArc({super.key, this.diameter = 50});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyPainter(),
      size: Size(diameter, diameter),
      child: Text(
        "Lyla",
        style: CustomTextStyle.coolWonderText.copyWith(fontSize: 40, color: CustomColors.whiteColor),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = CustomColors.primaryColor;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.height / 2, size.width / 2),
        height: size.height,
        width: size.width,
      ),
      -math.pi,
      -math.pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
