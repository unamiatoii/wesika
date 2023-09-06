import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wesika/composants/Buttons.dart';
import 'package:wesika/composants/TextField.dart';
import 'package:wesika/pages/Acceuil/EndRegister.dart';

import '../composants/NextPage.dart';
import '../pages/mainPage/HomePage.dart';

void _completeLogin(BuildContext context) {
  Navigator.pushReplacement<void, void>(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) => MyProfile(),
    ),
  );
}

//MOT DE PASSE ET E-MAIL
Future<void> validerInscription(
  TextEditingController emailController,
  TextEditingController passwordController,
  BuildContext context,
) async {
  String email = emailController.text;
  String password = passwordController.text;

  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    _completeLogin(context);
    print('User created successfully');
  } catch (e) {
    print('Erreur d\'inscription : $e');
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Erreur d'inscription"),
          content: Text("Quelque chose s'est mal passé : $e"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fermer la boîte de dialogue.
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}

Future<void> signInWithGoogle(BuildContext context) async {
  try {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(authCredential);

      // Authentification avec Firebase en utilisant l'authCredential
      // Enregistrez l'utilisateur dans votre base de données Firebase si nécessaire.

      // Redirigez l'utilisateur vers la page d'accueil en cas de succès.
      _completeLogin(context);
    } else {
      // L'utilisateur a annulé la connexion avec Google.
    }
  } catch (e) {
    // Gérez les erreurs d'authentification ici.
    print('Erreur d\'authentification Google : $e');

    // Affichez un pop-up d'erreur avec la cause de l'échec.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Erreur d'authentification Google"),
          content: Text("Quelque chose s'est mal passé : $e"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fermer la boîte de dialogue.
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}

//AVEC TELEPHONE

void signInWithNumber(BuildContext context) {
  TextEditingController numeroController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          title: Text("Entrez votre numero de telephone"),
          content: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Flexible(
                      flex: 3,
                      child: createTextFieldWithIcon(
                        "Telephone",
                        "Telephone",
                        Icons.person,
                        numeroController,
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      flex: 2,
                      child: createTextFieldWithIcon(
                        "OTP",
                        "OTP",
                        Icons.lock,
                        codeController,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                        child: FloatingActionButton.small(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10.0), // Arrondi des coins
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.close,
                      ),
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                    )),
                    SizedBox(
                      width: 2,
                    ),
                    Flexible(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).colorScheme.secondary),
                            onPressed: () {
                              sendOTPCode(numeroController.text);
                            },
                            child: Text(
                              "code",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ))),
                    Flexible(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).colorScheme.secondary),
                            onPressed: () {},
                            child: Text(
                              "Valider",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ))),
                  ],
                )
              ],
            ),
          ));
    },
  );
}

Future<void> sendOTPCode(String phoneNumber) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  try {
    await auth.verifyPhoneNumber(
      phoneNumber: "+225$phoneNumber",
      verificationCompleted: (verificationId) {
        print(verificationId);
      },
      verificationFailed: (error) {
        // Le code de vérification a échoué
      },
      codeSent: (verificationId, forceResendingToken) {},
      codeAutoRetrievalTimeout: (verificationId) {
        // Le délai d'expiration du code de vérification a expiré
      },
    );
  } catch (e) {
    print('Erreur lors de l\'envoi du code OTP : $e');
    // Gérez les autres erreurs ici.
  }
}

//PHOTO

