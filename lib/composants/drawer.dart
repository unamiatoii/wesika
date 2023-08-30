// import 'package:finance_me/Components/Buttons.dart';
// import 'package:flutter/material.dart';

// Widget buildDrawer(BuildContext context) {
//   return Drawer(
//     child: ListView(
//       padding: EdgeInsets.zero,
//       children: [
//         DrawerHeader(
//           decoration: const BoxDecoration(
//             color: Color.fromARGB(255, 73, 10, 115),
//           ),
//           child: CircleAvatar(
//             child: ClipOval(
//               child: Image.asset(
//                 'assets/logo.jpg',
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         ),
//         ListTile(
//           leading: Icon(Icons.home),
//           title: Text('Accueil'),
//           onTap: () {
//             Navigator.pop(context);
//           },
//         ),
//         ListTile(
//           leading: Icon(Icons.settings),
//           title: Text('Paramètres'),
//           onTap: () {
//             Navigator.pop(context);
//           },
//         ),
//         const Padding(padding: EdgeInsets.only(top: 370)),

//         InkWell(
//           child: buttons("DECONNEXION"),
//         )
//       ],
//     ),
//   );
// }
