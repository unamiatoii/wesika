// import 'package:flutter/material.dart';

// import '../../composants/ImageLogo.dart';
// import '../../composants/TextField.dart';

// class RegisterPage extends StatefulWidget {
//   RegisterPage({Key? key}) : super(key: key);

//   @override
//   _RegisterPageState createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   final List<Widget> _inputFields = [
//     createTextFieldWithIcon(
//         'Entrez votre nom', 'Nom', Icons.person, TextEditingController()),
//     createTextFieldWithIcon('Entrez votre adresse e-mail', 'E-mail',
//         Icons.email, TextEditingController()),
//     createTextFieldWithIcon('Entrez votre mot de passe', 'Mot de passe',
//         Icons.lock, TextEditingController()),
//     createTextFieldWithIcon('Confirmez le mot de passe',
//         'Confirmez le mot de passe', Icons.lock, TextEditingController()),
//   ];

//   int _currentIndex = 0;

//   void _previousField() {
//     if (_currentIndex > 0) {
//       setState(() {
//         _currentIndex--;
//       });
//     }
//   }

//   void _nextField() {
//     if (_currentIndex < _inputFields.length - 1) {
//       setState(() {
//         _currentIndex++;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Padding(
//                 padding: EdgeInsets.symmetric(vertical: 30, horizontal: 90),
//                 child: imageLogo("assets/illustration_sans_bg.png")),
//             const SizedBox(
//               height: 20,
//             ),
//             Text(
//               'Welcome Back !',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                   color: Theme.of(context).colorScheme.primary),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             _inputFields[_currentIndex],
//             const SizedBox(
//               height: 30,
//             ),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: _previousField,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Theme.of(context).colorScheme.secondary,
//                     foregroundColor: Theme.of(context).colorScheme.onPrimary,
//                     disabledForegroundColor:
//                         Theme.of(context).colorScheme.secondary,
//                     textStyle: const TextStyle(
//                       fontWeight: FontWeight.w700,
//                       fontSize: 15,
//                     ),
//                     minimumSize: const Size(150, 45),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(
//                           20), // Ajustez le rayon selon vos préférences
//                     ),
//                   ).copyWith(
//                     side: MaterialStateProperty.all<BorderSide>(
//                       BorderSide(
//                         color: Colors.black,
//                         width: 2,
//                       ),
//                     ),
//                   ),
//                   child: Text('PRECEDENT'),
//                 ),
//                 ElevatedButton(
//                   onPressed: _nextField,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: _currentIndex == _inputFields.length - 1
//                         ? Theme.of(context)
//                             .colorScheme
//                             .onPrimary // Utilisez la couleur onPrimary si c'est le dernier champ
//                         : Theme.of(context)
//                             .colorScheme
//                             .secondary, // Sinon, utilisez la couleur secondary
//                     foregroundColor: _currentIndex == _inputFields.length - 1
//                         ? Colors
//                             .white // Utilise la couleur primaire pour le dernier bouton
//                         : Theme.of(context).colorScheme.onPrimary,
//                     disabledForegroundColor:
//                         Theme.of(context).colorScheme.secondary,
//                     textStyle: const TextStyle(
//                       fontWeight: FontWeight.w700,
//                       fontSize: 15,
//                     ),
//                     minimumSize: const Size(150, 45),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ).copyWith(
//                     side: MaterialStateProperty.all<BorderSide>(
//                       BorderSide(
//                         color: Colors.black,
//                         width: 2,
//                       ),
//                     ),
//                   ),
//                   child: Text(_currentIndex == _inputFields.length - 1
//                       ? 'TERMINER'
//                       : 'SUIVANT'),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../../composants/ImageLogo.dart';
import '../../composants/TextField.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 90),
              child: imageLogo("assets/illustration_sans_bg.png"),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Welcome Back !',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            createTextFieldWithIcon(
              'Entrez votre nom',
              'Nom',
              Icons.person,
              _nameController,
            ),
            createTextFieldWithIcon(
              'Entrez votre adresse e-mail',
              'E-mail',
              Icons.email,
              _emailController,
            ),
            createTextFieldWithIcon(
              'Entrez votre mot de passe',
              'Mot de passe',
              Icons.lock,
              _passwordController,
            ),
            createTextFieldWithIcon(
              'Confirmez le mot de passe',
              'Confirmez le mot de passe',
              Icons.lock,
              _confirmPasswordController,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                // Valider et enregistrer les données d'inscription ici
                String name = _nameController.text;
                String email = _emailController.text;
                String password = _passwordController.text;
                String confirmPassword = _confirmPasswordController.text;

                // Vous pouvez implémenter la logique d'inscription ici
                // par exemple, vérifier la validité des données et les enregistrer

                // Pour l'exemple, nous imprimons les valeurs ici
                print('Nom: $name');
                print('Email: $email');
                print('Mot de passe: $password');
                print('Confirmer le mot de passe: $confirmPassword');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                disabledForegroundColor:
                    Theme.of(context).colorScheme.secondary,
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
                minimumSize: const Size(150, 45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ).copyWith(
                side: MaterialStateProperty.all<BorderSide>(
                  BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
              ),
              child: const Text('INSCRIPTION'),
            ),
          ],
        ),
      ),
    );
  }
}
