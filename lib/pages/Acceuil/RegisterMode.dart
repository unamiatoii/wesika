import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wesika/composants/fotgotId.dart';
import 'package:wesika/fonctions/RegisterPage.dart';
import 'package:wesika/pages/Acceuil/Login.dart';
import 'package:wesika/pages/Acceuil/Register.dart';

import '../../composants/ButtonChooseMode.dart';
import '../../composants/ImageLogo.dart';

class ChooseRegistrationMethodPage extends StatelessWidget {
  void _afficherBoiteDialogueCode(BuildContext context, String verificationId) {
    TextEditingController codeController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Code de Vérification"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: codeController,
                decoration: InputDecoration(labelText: "Code de vérification"),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  String code = codeController.text;
                  try {
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                      verificationId: verificationId,
                      smsCode: code,
                    );
                    await FirebaseAuth.instance
                        .signInWithCredential(credential);
                    // Utilisateur connecté avec succès, redirigez-le ou effectuez d'autres actions.
                  } catch (e) {
                    print('Erreur de vérification du code : $e');
                    // Gérez les erreurs de vérification du code ici.
                  }
                  Navigator.pop(
                      context); // Fermer la boîte de dialogue du code de vérification
                },
                child: Text("Valider"),
              ),
            ],
          ),
        );
      },
    );
  }

  void _demarrerVerificationNumero(BuildContext context, String numero) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      await auth.verifyPhoneNumber(
        phoneNumber: numero,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
          // Utilisateur connecté avec succès, redirigez-le ou effectuez d'autres actions.
        },
        verificationFailed: (FirebaseAuthException e) {
          print('Erreur de vérification : $e');
          // Gérez les erreurs de vérification ici.
        },
        codeSent: (String verificationId, int? resendToken) {
          // Le code a été envoyé avec succès, vous pouvez demander à l'utilisateur de le saisir.
          _afficherBoiteDialogueCode(context, verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Gérez le cas où le délai de récupération automatique du code a expiré.
        },
      );
    } catch (e) {
      print('Erreur d\'inscription avec téléphone : $e');
      // Gérez les autres erreurs d'inscription ici.
    }
  }

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
                        onPressed: () {},
                        text: "INSCRIPTION AVEC TELEPHONE",
                        iconColor: Theme.of(context).colorScheme.secondary,
                        iconData: Icons.facebook,
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
