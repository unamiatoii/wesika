import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wesika/composants/fotgotId.dart';
import 'package:wesika/fonctions/auth/RegisterPage.dart';
import 'package:wesika/pages/Acceuil/RegisterMode.dart';

import '../../composants/Buttons.dart';
import '../../composants/ImageLogo.dart';
import '../../composants/TextField.dart';
import '../../composants/passwordField.dart';
import '../mainPage/HomePage.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: textButton(
          context, "Créer un compte", ChooseRegistrationMethodPage()),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
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
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
                const SizedBox(height: 15),
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
                buttons(
                  onPressed: () => signInWithEmailAndPassword(
                      context, emailController.text, passwordController.text),
                  bordercolor: Theme.of(context).colorScheme.onPrimary,
                  backcolor: Theme.of(context).colorScheme.secondary,
                  context: context,
                  height: 45,
                  width: 150,
                  texte: "CONNEXION",
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Se Connecter Avec : ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        signInWithGoogle(context);
                      },
                      icon: Icon(
                        Icons.mail,
                        color: Theme.of(context).colorScheme.onPrimary,
                        size: 30,
                      ),
                      label: Text(
                        "Gmail",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        fixedSize: Size(150, 45), // Définir la taille souhaitée
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
