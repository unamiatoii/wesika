import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wesika/composants/Buttons.dart';
import 'package:wesika/fonctions/auth/RegisterPage.dart';

Widget buildDrawer(BuildContext context) {
  final User? user = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  return FutureBuilder<DocumentSnapshot>(
    future: _firestore.collection('Utilisateur').doc(user?.uid).get(),
    builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        // Pendant le chargement, vous pouvez afficher un indicateur de chargement.
        return CircularProgressIndicator();
      }

      if (snapshot.hasError) {
        // En cas d'erreur, vous pouvez afficher un message d'erreur.
        return Text('Erreur : ${snapshot.error}');
      }

      if (!snapshot.hasData) {
        // Si l'utilisateur n'a pas de données, vous pouvez afficher un message par défaut.
        return Text('Aucune donnée d\'utilisateur trouvée');
      }

      // Maintenant, vous pouvez extraire l'URL de l'image de profil de l'utilisateur depuis les données Firestore.
      final userProfileImageUrl = snapshot.data!['profileImageUrl'];

      return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 73, 10, 115),
              ),
              child: CircleAvatar(
                backgroundImage: NetworkImage(userProfileImageUrl),
                radius: 40, // Ajustez la taille de l'avatar selon vos besoins
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Accueil'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Paramètres'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Padding(padding: EdgeInsets.only(top: 370)),
            InkWell(
              child: buttons(
                backcolor: Colors.red,
                textcolor: Colors.black,
                context: context,
                height: 45,
                onPressed: () {
                  signOutUser(context);
                },
                texte: "DECONNEXION",
                width: 150,
              ),
            )
          ],
        ),
      );
    },
  );
}
