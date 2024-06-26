import 'dart:math';
import 'package:flutter/material.dart';
import 'GlobalVariables.dart';

class FractalPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    List<Offset> points = [];

    for (var item in rootPoints) {
      double? offsetX = double.parse(item.X.text) * mainLenght;
      double? offsetY = double.parse(item.Y.text) * mainLenght;
      if (!offsetX.isNaN && !offsetY.isNaN) {
        points.add(Offset(offsetX, offsetY));
      } else {
        break;
      }
    }
    
    for (var fs in ifs) {
      if (!canParseToDouble([fs.angle.text, fs.scale.text, fs.goToX.text, fs.goToY.text])) {
        break;
      }
    }

    for (int i = 1; i < points.length; i += 1) {
      canvas.drawLine(Offset(points[i-1].dx+(screenWidth/2),-points[i-1].dy+(screenWidth/2)), Offset(points[i].dx+(screenWidth/2),-points[i].dy+(screenWidth/2)), paint);
    }

    drawMyFractal(iterationCount-1, canvas, points);
  }

  bool canParseToDouble(List<String> input) {
    bool output = true;
    for (var item in input) {
      output = output && (double.tryParse(item) != null);
    }
    return output;
  }

  void drawMyFractal( int remains, Canvas canvas, List<Offset> oldPoints) {
    if ( remains < 1 && oldPoints.isNotEmpty ) {
      return;
    }

    for (var fs in ifs) {
      List<Offset> newPoints = [];
      for (var item in oldPoints) {
        newPoints.add(Offset(
          ( item.dx * double.parse(fs.scale.text) * cos(int.parse(fs.angle.text) * pi / 180) * ( (fs.flipX) ? -1 : 1 ) - item.dy * double.parse(fs.scale.text) * sin(int.parse(fs.angle.text) * pi / 180) ) * ( (fs.flipX || fs.flipY) ? 0 : 1 ) + double.parse(fs.goToX.text) * mainLenght
          ,
          ( item.dx * double.parse(fs.scale.text) * sin(int.parse(fs.angle.text) * pi / 180) * ( (fs.flipX || fs.flipY) ? 0 : 1 ) + item.dy * double.parse(fs.scale.text) * cos(int.parse(fs.angle.text) * pi / 180) ) * ( (fs.flipY) ? -1 : 1 ) + double.parse(fs.goToY.text) * mainLenght
          ));
      }
      for (int i = 1; i < newPoints.length; i += 1) {
        Paint newp = Paint()
        ..color = fs.color
        ..strokeWidth = 2;
        canvas.drawLine(Offset(newPoints[i-1].dx+(screenWidth/2),-newPoints[i-1].dy+(screenWidth/2)), Offset(newPoints[i].dx+(screenWidth/2),-newPoints[i].dy+(screenWidth/2)), newp);
      }
      drawMyFractal(remains-1, canvas, newPoints);
    }
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
