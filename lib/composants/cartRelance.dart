import 'package:flutter/material.dart';

Widget cardRelance(String img, String intituleProjet, int montant) {
  return Padding(
    padding: const EdgeInsets.only(top: 8),
    child: Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: Colors.white,
      child: ListTile(
        leading: Image.asset(
          "assets/$img",
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(
          intituleProjet,
          style: const TextStyle(
            color: Color.fromARGB(255, 73, 10, 115),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          '$montant FCFA',
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        trailing: InkWell(
          onTap: () {
            // Ajoutez ici la logique pour relancer les financiers
          },
          child: Icon(
            Icons.refresh,
            color: Color.fromARGB(255, 73, 10, 115),
            size: 30,
          ),
        ),
      ),
    ),
  );
}
