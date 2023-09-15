import 'package:flutter/material.dart';

Widget createButtonWithIcon(
    {required BuildContext context,
    required double horizontal,
    required double vertical,
    required String texte,
    required Color couleurBtn,
    required Color couleurIcon,
    required Color containerColor,
    required Icon Icone,
    required Function onpressed}) {
  return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(12.0), // Arrondi des coins
        ),
        padding:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: Row(
          mainAxisSize: MainAxisSize.min, // Réduit la largeur du Row
          children: [
            Text(
              texte,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 17,
                  fontWeight:
                      FontWeight.bold), // Ajustez la taille de la police ici
            ),
            SizedBox(width: 2.0), // Espacement réduit entre le texte et l'icône
            FloatingActionButton(
              onPressed: () {
                onpressed();
              },
              backgroundColor: couleurBtn, // Couleur du bouton
              foregroundColor: couleurIcon, // Couleur de l'icône
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0), // Arrondi des coins
              ),
              child: Icone,
              mini: true, // Bouton de taille réduite
              heroTag: null, // Empêche les conflits de tags héros
            ),
          ],
        ),
      ));
}
