import 'package:flutter/material.dart';

Widget buttons({
  required BuildContext context,
  required String texte,
  required Widget nextPage,
  required double height,
  required double width,
  required Color backcolor,
  required Color bordercolor,
}) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => nextPage,
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: backcolor,
        textStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 15,
        ),
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              20), // Ajustez le rayon selon vos préférences
        ),
      ).copyWith(
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(
            color: bordercolor,
            width: 2.0,
          ),
        ),
      ),
      child: Text(
        texte,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    ),
  );
}
