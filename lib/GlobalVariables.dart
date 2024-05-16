
import 'package:flutter/material.dart';

class FractalBody {
  FractalBody();
  var name = TextEditingController();
  Color color = Colors.black;
  var angle = TextEditingController();
  var scale = TextEditingController(); 
  var goToX = TextEditingController();
  var goToY = TextEditingController();
  bool flipX = false;
  bool flipY = false;
}

class MyPoint {
  MyPoint();
  var X = TextEditingController();
  var Y = TextEditingController();
}

List<FractalBody> ifs = [];

List<String> temp = [];

List<MyPoint> rootPoints = [];

double mainLenght = 1;
double screenWidth = 100;
int iterationCount = 2;

const inputTextStyle = TextStyle(
  fontSize: 20
);

final mainBoxDecoration = BoxDecoration(
  border: Border.all(),
  borderRadius: const BorderRadius.all(Radius.circular(15)),
); 

const double mainIconSize = 30;