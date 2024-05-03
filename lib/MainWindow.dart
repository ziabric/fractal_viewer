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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cool fractals"),
      ),
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Center(
                child: Container(
                  color: const Color.fromARGB(0, 0, 0, 0),
                  child: CustomPaint(
                    size: Size(mainLenght,mainLenght),
                    painter: FractalPainter(),
                  ),
                ),
              )
            )
          ),
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
                          setState(() {

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