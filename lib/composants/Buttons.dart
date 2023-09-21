import 'package:flutter/material.dart';

Widget buttons({
  required BuildContext context,
  required String texte,
  double? height, // Optionnelles avec null comme valeur par défaut.
  double? width, // Optionnelles avec null comme valeur par défaut.
  required Function onPressed,
  required Color backcolor,
  required Color bordercolor,
}) {
  height ??= 45.0; // Valeur de hauteur par défaut ajustée.
  width ??= (texte.length * 5.0); // Calcul de la largeur ajusté.

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
    child: ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: backcolor,
        textStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 15,
        ),
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        texte,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 18, color: bordercolor),
      ),
    ),
  );
}
