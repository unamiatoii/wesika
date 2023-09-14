import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wesika/composants/Buttons.dart';
import 'package:wesika/composants/TextField.dart';
import 'package:wesika/models/Users.dart'; // Assurez-vous que le chemin d'accès est correct.
import 'package:wesika/pages/Acceuil/EndRegister.dart';
import '../../composants/NextPage.dart';
import '../../pages/mainPage/HomePage.dart';

void _completeLogin(BuildContext context) {
  Navigator.pushReplacement<void, void>(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) => MyHomePage(),
    ),
  );
}

//Valider la premier partie de l'inscription
Future<void> validerInscription(
  TextEditingController _name,
  TextEditingController _surname,
  TextEditingController _email,
  TextEditingController _pwd,
  TextEditingController _number,
  BuildContext context,
) async {
  String email = _email.text;
  String password = _pwd.text;
  String name = _name.text;
  String surname = _surname.text;
  String number = _number.text;

  try {
    // Créez l'utilisateur dans Firebase Authentication
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Récupérez l'utilisateur actuel après sa création
    User? actuelUser = FirebaseAuth.instance.currentUser;

    // Vérifiez si l'utilisateur actuel existe
    if (actuelUser != null) {
      // Ajoutez l'utilisateur à Firestore avec son ID
      await FirebaseFirestore.instance
          .collection("Utilisateur")
          .doc(actuelUser.uid)
          .set({
        'nom': name, // Ajoutez le nom comme attribut dans le document Firestore
        'prenom': surname,
        'email': email,
        'numero': number,
        'motDePasse': password
      });
      changePage(context, endRegistration());
    } else {
      print('L\'utilisateur actuel est null, l\'inscription a échoué.');
    }

    print('User created successfully and added to Firestore');

    // Ajoutez ici le code pour rediriger l'utilisateur vers une autre page ou effectuer d'autres actions après une inscription réussie.
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

//Valider les informations supplementaires
Future<void> validerInformationsSupplementaire(
  File? _profileImage,
  String? _dateNaissance,
  String? _profession,
  String? _lieuResidence,
  File? _rectoIdImage,
  File? _versoIdImage,
  BuildContext context,
) async {
  try {
    // Récupérez l'utilisateur actuel
    User? actuelUser = FirebaseAuth.instance.currentUser;

    // Vérifiez si l'utilisateur actuel existe
    if (actuelUser != null) {
      // Créez une référence à l'emplacement de stockage pour les images de profil de l'utilisateur
      final storageReference = FirebaseStorage.instance
          .ref()
          .child('images/profile/${actuelUser.uid}');

      // Liste des futures pour stocker les URLs de téléchargement des images
      final List<Future<String>> imageUploadFutures = [];

      // Téléchargez les images (s'il y en a) et obtenez les URLs de téléchargement
      if (_profileImage != null) {
        final profileImageUploadTask =
            storageReference.child('profile.jpg').putFile(_profileImage);
        imageUploadFutures.add(profileImageUploadTask
            .then((taskSnapshot) => taskSnapshot.ref.getDownloadURL()));
      }

      if (_rectoIdImage != null) {
        final rectoIdImageUploadTask =
            storageReference.child('recto_id.jpg').putFile(_rectoIdImage);
        imageUploadFutures.add(rectoIdImageUploadTask
            .then((taskSnapshot) => taskSnapshot.ref.getDownloadURL()));
      }

      if (_versoIdImage != null) {
        final versoIdImageUploadTask =
            storageReference.child('verso_id.jpg').putFile(_versoIdImage);
        imageUploadFutures.add(versoIdImageUploadTask
            .then((taskSnapshot) => taskSnapshot.ref.getDownloadURL()));
      }

      // Attendez que toutes les images soient téléchargées
      final List<String> imageUrls = await Future.wait(imageUploadFutures);

      // Définissez les données à mettre à jour, y compris les URLs des images
      Map<String, dynamic> updatedData = {
        'dateNaissance': _dateNaissance,
        'profession': _profession,
        'lieuResidence': _lieuResidence,
        'profileImageUrl': imageUrls.isNotEmpty
            ? imageUrls[0]
            : null, // URL de l'image de profil
        'rectoIdImageUrl': imageUrls.length > 1
            ? imageUrls[1]
            : null, // URL de l'image recto de la pièce d'identité
        'versoIdImageUrl': imageUrls.length > 2
            ? imageUrls[2]
            : null, // URL de l'image verso de la pièce d'identité
        // Ajoutez d'autres champs ici en fonction de vos besoins
      };

      // Mettez à jour le document Firestore de l'utilisateur avec les nouvelles informations
      await FirebaseFirestore.instance
          .collection("Utilisateur")
          .doc(actuelUser.uid)
          .update(updatedData);

      // Naviguez vers la page suivante ou effectuez d'autres actions en cas de succès
      changePage(context, endRegistration());
    } else {
      print('L\'utilisateur actuel est null, la mise à jour a échoué.');
    }

    // Ajoutez ici le code pour rediriger l'utilisateur vers une autre page ou effectuer d'autres actions après la mise à jour réussie.
  } catch (e) {
    print('Erreur lors de la mise à jour : $e');
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Erreur lors de la mise à jour"),
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

// Avec TELEPHONE
void signInWithNumber(BuildContext context) {
  TextEditingController numeroController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Entrez votre numéro de téléphone"),
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
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Flexible(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                      ),
                      onPressed: () {
                        sendOTPCode(numeroController.text);
                      },
                      child: Text(
                        "Code",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                      ),
                      onPressed: () {
                        // Ajoutez ici le code pour valider le numéro et le code OTP.
                      },
                      child: Text(
                        "Valider",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}

Future<void> sendOTPCode(String phoneNumber) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  try {
    await auth.verifyPhoneNumber(
      phoneNumber: "+225$phoneNumber",
      verificationCompleted: (verificationId) {},
      verificationFailed: (error) {
        // Le code de vérification a échoué
      },
      codeSent: (verificationId, forceResendingToken) {},
      codeAutoRetrievalTimeout: (verificationId) {
        // Le délai d'expiration du code de vérification a expiré
      },
    );
  } catch (e) {
    // Gérez les autres erreurs ici.
  }
}
