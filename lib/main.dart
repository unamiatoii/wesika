import 'package:flutter/material.dart';
import 'package:wesika/pages/Acceuil/EndRegister.dart';
import 'package:wesika/pages/Acceuil/OnBoard.dart';
import 'package:wesika/pages/Acceuil/Register.dart';
import 'package:wesika/pages/Acceuil/RegisterMode.dart';
import 'package:wesika/pages/mainPage/HomePage.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color.fromARGB(255, 118, 205, 205);
    ; // Couleur principale
    const textColor = Color.fromARGB(255, 38, 71, 78); // Couleur secondaire
    const secondaryColor =
        Color.fromARGB(255, 242, 116, 56); // Couleur du texte

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(
          primary: primaryColor,
          secondary: secondaryColor,
          onPrimary: textColor,
          onSecondary: textColor,
        ),
      ),
      home: OnboardingPage(),
    );
  }
}
