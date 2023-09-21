import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wesika/composants/TontineInfoCard.dart';

class TontinesListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("Tontine")
          .where("participants", arrayContainsAny: [
        FirebaseAuth.instance.currentUser?.uid
      ]).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Erreur : ${snapshot.error}");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        // Le reste de votre code pour afficher les tontines lorsque l'utilisateur est connecté
        List<Widget> tontinesWidgets = [];
        final tontines = snapshot.data?.docs ?? [];

        for (QueryDocumentSnapshot tontineDoc in tontines) {
          Map<String, dynamic> tontineData =
              tontineDoc.data() as Map<String, dynamic>;

          // Créez un widget TontineInfoWidget pour chaque tontine et ajoutez-le à la liste.
          TontineInfoWidget tontineWidget = TontineInfoWidget(
            title: tontineData['nom'] ??
                '', // Remplacez 'title' par le nom du champ dans votre collection Firestore
            fondsARecolter: tontineData['montantAAtteindre'] ?? 0,
            fondsRecolte: tontineData['montantRecolte'] ?? 0,
            members: tontineData['nombreParticipant'] ?? 0,
          );

          tontinesWidgets.add(tontineWidget);
        }

        // Vérifiez si la liste des tontines est vide, puis affichez un message approprié.
        if (tontinesWidgets.isEmpty) {
          return Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimary
                        .withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(15),
              child: Center(
                child: Text(
                  'Aucune tontine pour le moment. Créez ou rejoignez-en une pour épargner en toute sécurité !',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.onPrimary),
                ),
              ));
        }

        return Row(
          children: tontinesWidgets,
        );
      },
    );
  }
}
