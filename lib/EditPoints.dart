import 'package:flutter/material.dart';
import 'GlobalVariables.dart';

class EditPoints extends StatefulWidget {
  const EditPoints({super.key});
  @override
  State<EditPoints> createState() => _EditPointsState();
}

class _EditPointsState extends State<EditPoints> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            rootPoints.add(MyPoint());  
          });
        } 
      ),
      appBar: AppBar(
        title: const Text("Edit points"),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider(
            thickness: 10,
          );
        }, 
        itemBuilder: (context, index) {
          if (rootPoints.isEmpty) rootPoints.add(MyPoint());
          return Container(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
              top: 10,
              bottom: 10
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  (index+1).toString(),
                  style: const TextStyle(
                    fontSize: 20
                  ),
                ),
                TextField(
                  style: inputTextStyle,
                  controller: rootPoints[index].X,
                  keyboardType: TextInputType.none,
                  decoration: const InputDecoration(labelText: 'X'),
                ),
                TextField(
                  style: inputTextStyle,
                  controller: rootPoints[index].Y,
                  keyboardType: TextInputType.none,
                  decoration: const InputDecoration(labelText: 'Y'),
                ),
                const SizedBox(height: 10,),
                TextButton.icon(
                  onPressed: () {
                    rootPoints.remove(rootPoints[index]);
                    setState(() {});
                  }, 
                  icon: const Icon(Icons.delete), 
                  label: const Text("Remove")
                )
              ],
            ),
          );
        }, 
        itemCount: rootPoints.length
      )
    ); 
  }
}

