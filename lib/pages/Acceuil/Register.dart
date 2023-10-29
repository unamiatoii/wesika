import 'package:flutter/material.dart';
import 'package:wesika/composants/Buttons.dart';
import 'package:wesika/composants/ImageLogo.dart';
import 'package:wesika/composants/creatTextfieldWithIcon.dart';
import 'package:wesika/pages/Acceuil/Login.dart';

import '../../fonctions/auth/RegisterPage.dart';

import '../../composants/fotgotId.dart';

class RegistrationPage extends StatefulWidget {
  RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          textButton(context, "J'ai deja un compte", LoginPage()),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 30),
                  child: imageLogo("assets/illustration_sans_bg.png"),
                ),
                Text(
                  'INSCRIPTION',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimary),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 2,
                      fit: FlexFit.loose,
                      child: createTextFieldWithIcon(
                        "Nom",
                        "Votre Nom",
                        Icons.person,
                        _nameController,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      flex: 3,
                      child: createTextFieldWithIcon(
                        "Entrez votre Prenom",
                        "Prenoms",
                        Icons.person,
                        _surnameController,
                      ),
                    ),
                  ],
                ),
                createTextFieldWithIcon("Entrez votre Adresse e-mail", "E-mail",
                    Icons.mail, _emailController),
                createTextFieldWithIcon("Entrez votre Numero de telephone",
                    "Télephone", Icons.phone_android, _phoneNumberController),
                createTextFieldWithIcon(
                  "Entrez votre Mot de passe",
                  "Mot de passe",
                  Icons.lock,
                  _passwordController,
                ),
                createTextFieldWithIcon(
                  "Confirmez le mot de passe",
                  "Confirmez le mot de passe",
                  Icons.lock,
                  _confirmPasswordController,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buttons(
                        context: context,
                        texte: 'TERMINER',
                        height: 45,
                        width: 150,
                        onPressed: () {
                          validerInscription(
                              _nameController,
                              _surnameController,
                              _emailController,
                              _passwordController,
                              _phoneNumberController,
                              context);
                        },
                        backcolor: Theme.of(context).colorScheme.secondary,
                        textcolor: Theme.of(context).colorScheme.onPrimary),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
