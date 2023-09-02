import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../composants/Buttons.dart';
import '../../composants/ImageLogo.dart';
import '../../composants/TextField.dart';
import '../../composants/passwordField.dart';
import '../mainPage/HomePage.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _handleSignIn(BuildContext context) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      final User? user = userCredential.user;

      if (user != null) {
        // L'utilisateur est connecté avec succès, vous pouvez naviguer vers la page d'accueil
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Erreur dans l'authentification"),
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Erreur dans l'authentification"),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                imageLogo("assets/illustration_sans_bg.png"),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Welcome Back !',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
                const SizedBox(height: 15),
                // Vos widgets UI ici, y compris les champs email et mot de passe
                createTextFieldWithIcon(
                  "Please enter your e-mail",
                  "E-mail",
                  Icons.email_outlined,
                  emailController,
                ),
                createPasswordFieldWithIcon(
                  hintText: "********",
                  labelText: "Password",
                  iconData: Icons.key_outlined,
                  controller: passwordController,
                ),
                SizedBox(height: 25),
                InkWell(
                  child: buttons(
                    onPressed: () => _handleSignIn(context),
                    bordercolor: Theme.of(context).colorScheme.primary,
                    backcolor: Theme.of(context).colorScheme.primary,
                    context: context,
                    height: 45,
                    width: 200,
                    texte: "CONNEXION",
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
