import 'package:flutter/material.dart';

Widget createTextFieldWithIcon(String hintText, String labelText,
    IconData iconData, TextEditingController controller) {
  return Builder(builder: (context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white,
          border: Border.all(
            color: Theme.of(context)
                .colorScheme
                .onPrimary, // Couleur de la bordure constante
            width: 1.5, // Largeur de la bordure
          ),
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle:
                TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            prefixIcon: Icon(
              iconData,
              color: Theme.of(context).colorScheme.secondary,
            ),
            border: InputBorder
                .none, // Supprimer la bordure par défaut du champ de texte
            contentPadding: EdgeInsets.zero,
            hintText: hintText,
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
        ),
      ),
    );
  });
}
