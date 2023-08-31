import 'package:flutter/material.dart';
import 'package:wesika/composants/changePage.dart';
import 'package:wesika/composants/fotgotId.dart';
import 'package:wesika/main.dart';

import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../composants/Buttons.dart';
import '../../composants/ImageLogo.dart';
import '../../composants/TextField.dart';
import '../../composants/passwordField.dart';
import '../mainPage/HomePage.dart';

bool verificationConnexion(
    TextEditingController mail, TextEditingController pwd) {
  var response = false;
  if (mail.text == "admin" && pwd.text == "admin") {
    response = true;
  } else {
    response = false;
  }

  return response;
}

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _handleGoogleSignIn() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser != null) {
      // L'utilisateur est connecté avec Google, vous pouvez récupérer ses informations ici
      // Par exemple, googleUser.displayName pour le nom affiché
      // Vous pouvez également enregistrer l'utilisateur dans votre base de données
    } else {
      // L'utilisateur a annulé la connexion avec Google
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: textButton(context, "Mot de passe oublié"),
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
                const SizedBox(
                  height: 15.0,
                ),
                createTextFieldWithIcon("Please enter your e-mail", "E-mail",
                    Icons.email_outlined, emailController),
                createPasswordFieldWithIcon(
                  hintText: "********",
                  labelText: "Password",
                  iconData: Icons.key_outlined,
                  controller: passwordController,
                ),
                const SizedBox(
                  height: 25,
                ),
                InkWell(
                    onTap: () {
                      if (verificationConnexion(
                          emailController, passwordController)) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyHomePage(),
                            ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text("Erreur dans le mot de passe ou le mail"),
                            duration: Duration(seconds: 3),
                            showCloseIcon: true,
                          ),
                        );
                      }
                    },
                    child: buttons(
                        bordercolor: Theme.of(context).colorScheme.primary,
                        backcolor: Theme.of(context).colorScheme.primary,
                        context: context,
                        height: 45,
                        width: 200,
                        texte: "CONNEXION",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage()));
                        })),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
