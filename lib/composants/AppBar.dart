import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final User? user = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: _firestore.collection('Utilisateur').doc(user?.uid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
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

        return AppBar(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          leading: IconButton(
            iconSize: 40,
            icon: Icon(
              Icons.menu,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          actions: [
            IconButton(
              icon: CircleAvatar(
                backgroundImage: NetworkImage(userProfileImageUrl),
                radius: 20, // Ajustez la taille de l'avatar selon vos besoins
              ),
              onPressed: () {
                // Action à effectuer lorsque l'utilisateur clique sur l'avatar.
              },
              iconSize: 40,
            ),
          ],
        );
      },
    );
  }
}
