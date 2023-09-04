import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../composants/NextPage.dart';
import '../pages/mainPage/HomePage.dart';

void _completeLogin(BuildContext context) {
  Navigator.pushReplacement<void, void>(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) => const MyHomePage(),
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

Future<void> inscriptionAvecTelephone(BuildContext context, String numeroDeTelephone) async {
  FirebaseAuth auth = FirebaseAuth.instance;

  try {
    await auth.verifyPhoneNumber(
      phoneNumber: numeroDeTelephone, // Remplacez par le numéro de téléphone de l'utilisateur.
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

