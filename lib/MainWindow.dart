import 'package:flutter/material.dart';
import 'package:flutter_turtle/flutter_turtle.dart';
import 'package:fractal/GlobalVariables.dart';

import 'FractalSettings.dart';
import 'FractalPainter.dart';

class MainWindow extends StatefulWidget {
  const MainWindow({super.key});
  @override
  State<MainWindow> createState() => _MainWindowState();
}

class _MainWindowState extends State<MainWindow> with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  List<TurtleCommand> generateFractal(int iterations, double length, double scale, double angle, Vector2 shift) {
    
    List<TurtleCommand> commands = [];
    double newLength = length;

    for (int i = 1; i <= iterations; i++) {

      commands.add(Forward((_) => newLength));
      commands.add(Left((_) => angle));

      newLength *= scale;

    }

    return commands;
  }

  @override
  Widget build(BuildContext context) {

    // List<TurtleView> fractals = [];

    // for (var fractal in ifs) {

    //   final newFractal = TurtleView(
    //     commands: [
    //       PenDown(),
    //       SetColor((_) => Colors.blueGrey),
    //       SetStrokeWidth((_) => 2),
          
    //       Repeat((p0) => 10, (ifs.isEmpty) ? [] : generateFractal(
    //         iterationCount,
    //         mainLenght,
    //         double.parse(fractal.scale.text),
    //         double.parse(fractal.angle.text),
    //         Vector2(0, 0)
    //       )),

    //       PenUp(),
    //     ],
    //     child: const SizedBox(
    //       width: 1800,
    //       height: 1800,
    //       child: Text(""),
    //     ),
    //   );

    //   fractals.add(newFractal);
    // }

    print("MainWindow");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cool fractals"),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                color: Colors.white,
                child: CustomPaint(
                  size: const Size(400,400),
                  painter: FractalPainter(),
                ),
              )
            )
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: mainBoxDecoration,
                  child: Row(
                    children: [
                      IconButton(
                        iconSize: 30,
                        onPressed: (){
                          mainLenght += 30;
                          setState(() {});
                        }, 
                        icon: const Icon(Icons.add)
                      ),
                      Text(mainLenght.toString()),
                      IconButton(
                        iconSize: 30,
                        onPressed: (){
                          mainLenght -= 30;
                          if (mainLenght <= 0) {
                            mainLenght += 30;
                          }
                          setState(() {});
                        }, 
                        icon: const Icon(Icons.remove)
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10,),
                Container(
                  decoration: mainBoxDecoration,
                  child: Row(
                    children: [
                      IconButton(
                        iconSize: 30,
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const FractalSettings()));
                        }, 
                        icon: const Icon(Icons.menu)
                      ),
                      IconButton(
                        iconSize: 30,
                        onPressed: (){
                          setState(() {});
                        }, 
                        icon: const Icon(Icons.refresh)
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10,),
                Container(
                  decoration: mainBoxDecoration,
                  child: Row(
                    children: [
                      IconButton(
                        iconSize: 30,
                        onPressed: (){
                          iterationCount += 1;
                          setState(() {});
                        }, 
                        icon: const Icon(Icons.add)
                      ),
                      Text(iterationCount.toString()),
                      IconButton(
                        iconSize: 30,
                        onPressed: (){
                          iterationCount -= 1;
                          if (iterationCount <= 0) {
                            iterationCount += 1;
                          }
                          setState(() {});
                        }, 
                        icon: const Icon(Icons.remove)
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      )
    ); 
  }
}