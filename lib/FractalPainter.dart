import 'package:flutter/material.dart';
import 'GlobalVariables.dart';

class FractalPainter extends CustomPainter {

  List<Offset> rootPoints = [
    Offset(0, 0),
    Offset(0, 20)
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final double sideLength = size.shortestSide * 0.6;
    final double offsetX = (size.width - sideLength) / 2;
    final double offsetY = (size.height - sideLength) / 2;

    final Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    drawFractal(canvas, paint, offsetX, offsetY, sideLength);
  }

  void drawMyFractal( int remains, Canvas canvas, Paint paint, List<Offset> points, FractalBody fractalBody) {
    if ( remains < 1 ) {
      return;
    }

    for (var fs in ifs) {

      for (var point in points) {

        
      }
    }
  }

  void drawFractal(Canvas canvas, Paint paint, double x, double y, double sideLength) {
    if (sideLength < 1) {
      return;
    }



    // canvas.drawRect(
    //   Rect.fromLTWH(x, y, sideLength, sideLength),
    //   paint,
    // );

    final double nextSize = sideLength / 3;



    // Recursively draw eight smaller squares
    // drawFractal(canvas, paint, x, y, nextSize); // Top left
    // drawFractal(canvas, paint, x + nextSize, y, nextSize); // Top middle
    // drawFractal(canvas, paint, x + 2 * nextSize, y, nextSize); // Top right
    // drawFractal(canvas, paint, x, y + nextSize, nextSize); // Middle left
    // drawFractal(canvas, paint, x + 2 * nextSize, y + nextSize, nextSize); // Middle right
    // drawFractal(canvas, paint, x, y + 2 * nextSize, nextSize); // Bottom left
    // drawFractal(canvas, paint, x + nextSize, y + 2 * nextSize, nextSize); // Bottom middle
    // drawFractal(canvas, paint, x + 2 * nextSize, y + 2 * nextSize, nextSize); // Bottom right
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
