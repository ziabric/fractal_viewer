import 'package:flutter/material.dart';
import 'GlobalVariables.dart';

// class HelpPage extends StatefulWidget {
//   const HelpPage({super.key});
//   @override
//   State<HelpPage> createState() => _HelpPageState();
// }

// class _HelpPageState extends State<HelpPage> {

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Manual"),
//         actions: [
//           TextButton.icon(
//             onPressed: () {
//               if (language == 0) {
//                 setState(() {language = 1;});
//               } else if (language == 1) {
//                 setState(() {language = 0;});
//               }
//             }, 
//             icon: const Icon(Icons.language), 
//             label: Text(translatedText[language][0])
//           )
//         ],
//       ),
//       body: ListView.separated(
//         separatorBuilder: (context, index) {
//           return const Divider(
//             thickness: 10,
//           );
//         }, 
//         itemBuilder: (context, index) {
//           return Container(
//             padding: const EdgeInsets.only(
//               left: 30,
//               right: 30,
//               top: 10,
//               bottom: 10
//             ),
//             child: const Text("")
//           );
//         }, 
//         itemCount: rootPoints.length
//       )
//     ); 
//   }
// }

