import 'package:flutter/material.dart';
import 'GlobalVariables.dart';
import 'EditPoints.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class FractalSettings extends StatefulWidget {
  const FractalSettings({super.key});
  @override
  State<FractalSettings> createState() => _FractalSettingsState();
}

class _FractalSettingsState extends State<FractalSettings> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        actions: [
          IconButton(
            onPressed: () {
              FractalBody newFB = FractalBody();
              newFB.name.value = const TextEditingValue(text: "new A");
              ifs.insert(0, newFB);
              setState(() {});
            }, 
            icon: const Icon(Icons.add), 
            iconSize: mainIconSize,
            // label: const Text("Add new func")
          ),
          const SizedBox(width: 10,),
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const EditPoints()));
            }, 
            icon: const Icon(Icons.gesture), 
            iconSize: mainIconSize,
            // label: const Text("Set points")
          ),
          const SizedBox(width: 10,),
        ],
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider(
            thickness: 10,
          );
        }, 
        itemBuilder: (context, index) {
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
                TextField(
                  style: inputTextStyle,
                  controller: ifs[index].name,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  style: inputTextStyle,
                  controller: ifs[index].angle,
                  decoration: const InputDecoration(labelText: 'Angle'),
                ),
                TextField(
                  style: inputTextStyle,
                  controller: ifs[index].scale,
                  decoration: const InputDecoration(labelText: 'Scale'),
                ),
                TextField(
                  style: inputTextStyle,
                  controller: ifs[index].goToX,
                  decoration: const InputDecoration(labelText: 'go to X'),
                ),
                TextField(
                  style: inputTextStyle,
                  controller: ifs[index].goToY,
                  decoration: const InputDecoration(labelText: 'go to Y'),
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("X flip:"),
                    Checkbox(value: ifs[index].flipX, onChanged: (value) {setState(() {
                      ifs[index].flipX = value!;
                    });}),
                    const SizedBox(width: 50,),
                    const Text("Y flip:"),
                    Checkbox(value: ifs[index].flipY, onChanged: (value) {setState(() {
                      ifs[index].flipY = value!;
                    });}),
                  ],
                ),
                const SizedBox(height: 10,),
                ColorPicker(
                  pickerColor: ifs[index].color,
                  onColorChanged: (newColor) {ifs[index].color = newColor;},
                  enableAlpha: false,
                  paletteType: PaletteType.hsv,
                  colorPickerWidth: 300,
                  pickerAreaHeightPercent: 0.3,
                  showLabel: false,
                ),
                // const SizedBox(height: 10,),
                TextButton.icon(
                  onPressed: () {
                    ifs.remove(ifs[index]);
                    setState(() {});
                  }, 
                  icon: const Icon(Icons.delete), 
                  label: const Text("Remove")
                )
              ],
            ),
          );
        }, 
        itemCount: ifs.length
      )
    ); 
  }
}

