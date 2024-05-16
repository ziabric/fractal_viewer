import 'package:flutter/material.dart';
import 'package:fractal/GlobalVariables.dart';

import 'FractalSettings.dart';
import 'FractalPainter.dart';

class MainWindow extends StatefulWidget {
  const MainWindow({super.key});
  @override
  State<MainWindow> createState() => _MainWindowState();
}

class _MainWindowState extends State<MainWindow> with TickerProviderStateMixin {

  Offset position = Offset(0, 0);

  @override
  void initState() {
    super.initState();
  }
  
  bool canParseToDouble(List<String> input) {
    bool output = true;
    for (var item in input) {
      output = output && (double.tryParse(item) != null);
    }
    return output;
  }

  @override
  Widget build(BuildContext context) {

    screenWidth = 10;

    bool havePoints = false;

    for (var point in rootPoints) {
      if ( double.tryParse(point.X.text) == null || double.tryParse(point.Y.text) == null) {
        havePoints = false;
        break;
      } else {
        havePoints = true;
      }
      if (double.parse(point.X.text) > screenWidth) screenWidth = double.parse(point.X.text);
      if (double.parse(point.Y.text) > screenWidth) screenWidth = double.parse(point.Y.text);
    }

    for (var fs in ifs) {
      if (!canParseToDouble([fs.angle.text, fs.scale.text, fs.goToX.text, fs.goToY.text])) {
        havePoints = false;
        break;
      }
    }

    screenWidth = screenWidth * mainLenght * 3;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cool fractals"),
        actions: [
          IconButton(
            onPressed: () {

            }, 
            icon: const Icon(Icons.help),
            iconSize: mainIconSize,
        )
        ],
      ),
      body: Stack(
        children: [
          (!havePoints) ? const Text("") : Positioned(
            left: position.dx,
            top: position.dy,
            width: screenWidth,
            height: screenWidth,
            child: GestureDetector(
              child: Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(50, 0, 0, 255),
                  borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                child: CustomPaint(
                  size: Size(screenWidth * mainLenght,screenWidth * mainLenght),
                  painter: FractalPainter(),
                ),
              ),
              onPanUpdate: (details) {
                setState(() {
                  position = Offset(
                    position.dx + details.delta.dx,
                    position.dy + details.delta.dy,
                  );
                });
              },
            )
          ),
          // DragDropWidget(),
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
                        iconSize: mainIconSize,
                        onPressed: (){
                          mainLenght += 0.3;
                          setState(() {});
                        }, 
                        icon: const Icon(Icons.add)
                      ),
                      Text(mainLenght.toStringAsFixed(1)),
                      IconButton(
                        iconSize: mainIconSize,
                        onPressed: (){
                          mainLenght -= 0.3;
                          if (mainLenght <= 0) {
                            mainLenght += 0.3;
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
                        iconSize: mainIconSize,
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FractalSettings()));
                        }, 
                        icon: const Icon(Icons.menu)
                      ),
                      IconButton(
                        iconSize: mainIconSize,
                        onPressed: (){
                          setState(() {
                            position = Offset.zero;
                          });
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
                        iconSize: mainIconSize,
                        onPressed: (){
                          iterationCount += 1;
                          setState(() {});
                        }, 
                        icon: const Icon(Icons.add)
                      ),
                      Text(iterationCount.toString()),
                      IconButton(
                        iconSize: mainIconSize,
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
