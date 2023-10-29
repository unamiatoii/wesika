import 'package:flutter/material.dart';
import 'package:wesika/composants/AppBar.dart';
import 'package:wesika/composants/BottomAppBar.dart';
import 'package:wesika/composants/drawer.dart';
import 'package:wesika/pages/Acceuil/EndRegister.dart';
import 'package:wesika/pages/Acceuil/OnBoard.dart';
import 'package:wesika/pages/Acceuil/Register.dart';
import 'package:wesika/pages/Acceuil/RegisterMode.dart';
import 'package:wesika/pages/mainPage/HomePage.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wesika/pages/mainPage/NouvelleTontinePage.dart';
import 'package:wesika/pages/mainPage/RejoindreTontinePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color.fromARGB(255, 255, 255, 255);
    ; 
    const textColor = Color.fromARGB(255, 28, 41, 66); 
    const secondaryColor =
        Color.fromARGB(255, 95, 194, 186);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
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
        home: OnboardingPage());
  }
}

class Home extends StatelessWidget {
  final Widget nextPage;

  const Home({Key? key, required this.nextPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: buildDrawer(context),
      body: nextPage,
      bottomNavigationBar: MyBottomAppBar(),
    );
  }
}
