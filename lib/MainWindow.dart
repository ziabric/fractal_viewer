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
    
  @override
  Widget build(BuildContext context) {

    screenWidth = 10;

    for (var point in rootPoints) {
      if (double.parse(point.X.text) > screenWidth) screenWidth = double.parse(point.X.text);
      if (double.parse(point.Y.text) > screenWidth) screenWidth = double.parse(point.Y.text);
    }

    screenWidth = screenWidth * mainLenght * 3;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cool fractals"),
      ),
      body: Stack(
        children: [
          Positioned(
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
                        iconSize: 30,
                        onPressed: (){
                          mainLenght += 0.3;
                          setState(() {});
                        }, 
                        icon: const Icon(Icons.add)
                      ),
                      Text(mainLenght.toStringAsFixed(1)),
                      IconButton(
                        iconSize: 30,
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
                        iconSize: 30,
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FractalSettings()));
                        }, 
                        icon: const Icon(Icons.menu)
                      ),
                      IconButton(
                        iconSize: 30,
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

// class DragDropWidget extends StatefulWidget {
//   @override
//   _DragDropWidgetState createState() => _DragDropWidgetState();
// }

// class _DragDropWidgetState extends State<DragDropWidget> {
//   Offset position = Offset(0, 0);
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height - 117,
//           color: Colors.blueAccent,
//           child: Positioned(
//             left: position.dx,
//             top: position.dy,
//             height: screenWidth * mainLenght,
//             width: screenWidth * mainLenght,
//             child: Container(
//               color: Colors.red,
//               height: screenWidth * mainLenght,
//               width: screenWidth * mainLenght,
//               child: GestureDetector(
//                 onPanUpdate: (details) {
//                   setState(() {
//                     position = Offset(
//                       position.dx + details.delta.dx,
//                       position.dy + details.delta.dy,
//                     );
//                   });
//                 },
//                 child: Container(
//                   height: screenWidth * mainLenght,
//                   width: screenWidth * mainLenght,
//                   color: Colors.amber,
//                   child: CustomPaint(
//                     size: Size(screenWidth * mainLenght,screenWidth * mainLenght),
//                     painter: FractalPainter(),
//                 )
//               ),
//             )
//           ),
//         ))
//       ],
//     );
//   }
// }