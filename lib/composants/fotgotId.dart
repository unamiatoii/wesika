import 'package:flutter/material.dart';

Widget textButton(BuildContext context, String texte) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: TextButton(
      onPressed: null,
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
