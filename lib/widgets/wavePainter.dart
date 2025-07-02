import 'package:flutter/material.dart';

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()..color = Color(0xFF9FC5FF); // Lighter blue to match design
    final path =
        Path()
          ..lineTo(0, size.height * 0.75) // Adjusted wave position
          ..quadraticBezierTo(
            size.width * 0.25,
            size.height * 0.95,
            size.width * 0.5,
            size.height * 0.8,
          )
          ..quadraticBezierTo(
            size.width * 0.75,
            size.height * 0.65,
            size.width,
            size.height * 0.8,
          )
          ..lineTo(size.width, 0)
          ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
