import 'package:flutter/material.dart';
import 'package:vision_app/ui/widgets/theme/constants_drawing.dart';

class DrawingPainter extends CustomPainter {
  List<Offset> points;

  DrawingPainter(this.points);

  final Paint _paint = Paint()
    ..strokeCap = StrokeCap.round
    ..color = Colors.black
    ..strokeWidth = Constantss.strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    for (var i = 0; i < points.length - 1; i++) {
      print(points[i]);
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], _paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
