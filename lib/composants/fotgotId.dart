import 'package:flutter/material.dart';

Widget textButton(BuildContext context, String texte, Widget nextPage) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: TextButton(
      onPressed:() {
         Navigator.push(
      context, MaterialPageRoute(builder: (context) => nextPage));

      },
      child: Text(
        texte,
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontWeight: FontWeight.bold,
          fontSize: 14.0,
        ),
      ),
    ),
  );
}
