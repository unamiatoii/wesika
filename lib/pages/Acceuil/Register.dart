import 'package:flutter/material.dart';
import 'package:wesika/composants/Buttons.dart';
import 'package:wesika/composants/DateField.dart';
import 'package:wesika/composants/ImageLogo.dart';
import 'package:wesika/composants/TextField.dart';

import '../../composants/changePage.dart';
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
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();
  final TextEditingController _educationLevelController =
      TextEditingController();

  int currentStep = 1;

  void _nextStep() {
    setState(() {
      currentStep++;
    });
  }

  void _previousStep() {
    setState(() {
      currentStep--;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> steps = [
      // Étape 1
      Column(
        children: [
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
        ],
      ),
      // Étape 2
      Column(
        children: [
          createDateFieldWithIcon("Date de naissance", "Date de naissance",
              Icons.calendar_today, _dateOfBirthController),
          createTextFieldWithIcon(
            "Adresse physique",
            "Entrez votre Adresse physique",
            Icons.location_on,
            _addressController,
          ),
          createTextFieldWithIcon(
            "Profession ou emploi",
            "Entrez votre Profession ou emploi",
            Icons.work,
            _occupationController,
          ),
          createTextFieldWithIcon(
            "Niveau d'éducation",
            "Entrez votre Niveau d'éducation",
            Icons.school,
            _educationLevelController,
          ),
        ],
      ),
    ];

    return Scaffold(
      bottomNavigationBar: textButton(context, "J'ai deja un compte"),
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
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
                  color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(
              height: 20,
            ),

            steps[currentStep - 1], // AFFICHE LES ETAPES

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (currentStep > 1)
                  buttons(
                      context: context,
                      texte: 'PRECEDENT',
                      height: 45,
                      width: 150,
                      onPressed: () {
                        _previousStep();
                      },
                      backcolor: Theme.of(context).colorScheme.primary,
                      bordercolor: Theme.of(context).colorScheme.onPrimary),
                if (currentStep < steps.length)
                  buttons(
                      context: context,
                      texte: 'SUIVANT',
                      height: 45,
                      width: 150,
                      onPressed: () {
                        _nextStep();
                      },
                      backcolor: Theme.of(context).colorScheme.primary,
                      bordercolor: Theme.of(context).colorScheme.onPrimary),
                if (currentStep == steps.length)
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
                          _phoneNumberController,
                          _passwordController,
                          _confirmPasswordController,
                          _dateOfBirthController,
                          _addressController,
                          _occupationController,
                          _educationLevelController,
                        );
                      },
                      backcolor: Theme.of(context).colorScheme.secondary,
                      bordercolor: Theme.of(context).colorScheme.onPrimary),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
