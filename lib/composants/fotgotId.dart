import 'package:flutter/material.dart';

Widget mdpForget(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: TextButton(
      onPressed: null,
      child: Text(
        'Mot de passe oublié !',
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontWeight: FontWeight.bold,
          fontSize: 14.0,
        ),
      ),
    ),
  );
}
