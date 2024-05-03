import 'dart:math';
import 'package:flutter/material.dart';
import 'GlobalVariables.dart';

class FractalPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    List<Offset> points = [];

    for (var item in rootPoints) {
      double? offsetX = double.parse(item.X.text);
      double? offsetY = double.parse(item.Y.text);
      if (offsetX.isFinite && offsetY.isFinite) {
        points.add(Offset(offsetX, offsetY));
      } else {
      }
    }

    for (int i = 1; i < points.length; i += 1) {
      canvas.drawLine(Offset(points[i-1].dx+(mainLenght/2),points[i-1].dy+(mainLenght/2)), Offset(points[i].dx+(mainLenght/2),points[i].dy+(mainLenght/2)), paint);
    }

    drawMyFractal(iterationCount-1, canvas, paint, points);
  }

  void drawMyFractal( int remains, Canvas canvas, Paint paint, List<Offset> oldPoints) {
    if ( remains < 1 && oldPoints.isNotEmpty ) {
      return;
    }

    for (var fs in ifs) {
      List<Offset> newPoints = [];
      for (var item in oldPoints) {
        newPoints.add(Offset(
          item.dx * double.parse(fs.scale.text) * ( cos(int.parse(fs.angle.text)) - sin(int.parse(fs.angle.text)) ) + double.parse(fs.goToX.text)
          ,
          item.dy * double.parse(fs.scale.text) * ( sin(int.parse(fs.angle.text)) + cos(int.parse(fs.angle.text)) ) + double.parse(fs.goToY.text)
          ));
      }
      for (int i = 1; i < newPoints.length; i += 1) {
        canvas.drawLine(Offset(newPoints[i-1].dx+(mainLenght/2),newPoints[i-1].dy+(mainLenght/2)), Offset(newPoints[i].dx+(mainLenght/2),newPoints[i].dy+(mainLenght/2)), paint);
      }
      drawMyFractal(remains-1, canvas, paint, newPoints);
    }
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
