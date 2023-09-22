import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wesika/composants/ImageLogo.dart';

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
          return AppBar(
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
              CircularProgressIndicator(), // Affichez le CircularProgressIndicator en chargement.
            ],
          );
        }

        final userProfileImageUrl = snapshot.data?['profileImageUrl'] as String;

        return AppBar(
          elevation: 0,
          leading: IconButton(
            iconSize: 40,
            icon: Icon(
              Icons.menu,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          title: imageLogo('assets/wesika_sans_bg.png'),
          actions: [
            IconButton(
              onPressed: () {
                // Action à effectuer lorsque l'utilisateur clique sur l'avatar.
              },
              iconSize: 40,
              icon: Container(
                width: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.onPrimary,
                    width:
                        2.0, // Ajustez la largeur de la bordure selon vos besoins
                  ),
                ),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(userProfileImageUrl),
                  radius: 20, // Ajustez la taille de l'avatar selon vos besoins
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
