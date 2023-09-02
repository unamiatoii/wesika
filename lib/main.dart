import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wesika/pages/Acceuil/OnBoard.dart';
import 'package:wesika/pages/mainPage/HomePage.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
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
      home: const OnboardingPage(),
    );
  }
}
