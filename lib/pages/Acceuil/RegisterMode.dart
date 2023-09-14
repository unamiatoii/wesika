import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wesika/composants/fotgotId.dart';
import 'package:wesika/fonctions/auth/RegisterPage.dart';
import 'package:wesika/pages/Acceuil/Login.dart';
import 'package:wesika/pages/Acceuil/Register.dart';

import '../../composants/ButtonChooseMode.dart';
import '../../composants/ImageLogo.dart';

class ChooseRegistrationMethodPage extends StatelessWidget {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar:
            textButton(context, "J'ai deja un compte", LoginPage()),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  imageLogo("assets/illustration_inscription.png"),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "COMMENÇONS : ",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Column(
                    children: [
                      BtnRegistrationMode(
                        onPressed: () {
                          signInWithGoogle(context);
                        },
                        text: "INSCRIPTION AVEC GMAIL",
                        iconColor: Theme.of(context).colorScheme.secondary,
                        iconData: Icons.mail_outline,
                      ),
                      SizedBox(height: 20),
                      BtnRegistrationMode(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegistrationPage()));
                        },
                        text: "INSCRIPTION AVEC E-MAIL",
                        iconColor: Theme.of(context).colorScheme.secondary,
                        iconData: Icons.email,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
