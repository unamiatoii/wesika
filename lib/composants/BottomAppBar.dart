// import 'package:finance_me/Pages/Dashboard.dart';
// import 'package:finance_me/Pages/Relance/Relance.dart';
// import 'package:flutter/material.dart';

// void main() => runApp(MaterialApp(home: MyBottomAppBar()));

// class MyBottomAppBar extends StatelessWidget {
//   final color = Color.fromARGB(255, 73, 10, 115);

//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       elevation: 0,
//       color: Colors.white,
//       height: 60,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           IconButton(
//             icon: Icon(Icons.home, color: color),
//             onPressed: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => Dashboard()));
//             },
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 10),
//             child: IconButton(
//               icon: Icon(Icons.share, color: color, size: 30),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => Relance()),
//                 );
//               },
//             ),
//           ),
//           IconButton(
//             icon: Icon(Icons.settings, color: color),
//             onPressed: () {},
//           ),
//         ],
//       ),
//     );
//   }
// }
