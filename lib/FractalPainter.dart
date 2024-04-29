import 'dart:math';

import 'package:flutter/material.dart';


class FractalPainter extends CustomPainter {



  FractalPainter()

  @override
  void paint(Canvas canvas, Size size) {
    final double sideLength = size.shortestSide * 0.8;
    final double offsetX = (size.width - sideLength) / 2;
    final double offsetY = (size.height - sideLength) / 2;

    final Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    drawFractal(canvas, paint, offsetX, offsetY, sideLength);
  }

  void drawFractal(
      Canvas canvas, Paint paint, double x, double y, double sideLength) {
    if (sideLength < 1) {
      return;
    }

    canvas.drawRect(
      Rect.fromLTWH(x, y, sideLength, sideLength),
      paint,
    );

    final double nextSize = sideLength / 3;

    // Recursively draw eight smaller squares
    drawFractal(canvas, paint, x, y, nextSize); // Top left
    drawFractal(canvas, paint, x + nextSize, y, nextSize); // Top middle
    drawFractal(canvas, paint, x + 2 * nextSize, y, nextSize); // Top right
    drawFractal(canvas, paint, x, y + nextSize, nextSize); // Middle left
    drawFractal(canvas, paint, x + 2 * nextSize, y + nextSize, nextSize); // Middle right
    drawFractal(canvas, paint, x, y + 2 * nextSize, nextSize); // Bottom left
    drawFractal(canvas, paint, x + nextSize, y + 2 * nextSize, nextSize); // Bottom middle
    drawFractal(canvas, paint, x + 2 * nextSize, y + 2 * nextSize, nextSize); // Bottom right
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
