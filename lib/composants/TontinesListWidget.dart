import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wesika/composants/TontineInfoCard.dart';

class TontinesListWidget extends StatelessWidget {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("Tontine")
          .where("participants", arrayContainsAny: [user?.uid]).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Erreur : ${snapshot.error}");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Affiche un indicateur de chargement en attendant les données.
        }

        // Une fois les données chargées, vous pouvez les afficher.
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

        return Row(
          children: tontinesWidgets,
        );
      },
    );
  }
}
