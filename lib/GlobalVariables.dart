
import 'package:flutter/material.dart';

class FractalBody {
  FractalBody();
  final name = TextEditingController();
  Color color = Colors.black;
  final angle = TextEditingController();
  final scale = TextEditingController(); 
  final goToX = TextEditingController();
  final goToY = TextEditingController();
}

class Vector2 {
  Vector2(this.x, this.y);
  double x = 0;
  double y = 0;
}

List<FractalBody> ifs = [];

List<String> temp = [];

double mainLenght = 300;
int iterationCount = 2;

const inputTextStyle = TextStyle(
  fontSize: 20
);

final mainBoxDecoration = BoxDecoration(
  border: Border.all(),
  borderRadius: BorderRadius.all(Radius.circular(15)),
); 