import 'package:flutter/material.dart';

Widget createButtonWithIcon(
    {required BuildContext context,
    required double horizontal,
    required double vertical,
    required String texte,
    required Color couleurBtn,
    required Color couleurIcon,
    required Icon Icone,
    required Function onpressed}) {
  return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1.5),
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              texte,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
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
