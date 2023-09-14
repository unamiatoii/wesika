import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wesika/models/Participant.dart';

class Tontine {
  String nom;
  int nombreParticipants;
  double montantAAtteindre;
  double montantAVerser;
  List<String> participantsId;

  Tontine({
    required this.nom,
    required this.nombreParticipants,
    required this.montantAAtteindre,
    required this.montantAVerser,
    required this.participantsId,
  });

  // Fonction pour ajouter une nouvelle tontine à Firestore
  Future<void> createTontine() async {
    try {
      await FirebaseFirestore.instance.collection("Tontines").add({
        "nom": nom,
        "nombreParticipants": nombreParticipants,
        "montantAAtteindre": montantAAtteindre,
        "montantAVerser": montantAVerser,
        // Vous pouvez ajouter d'autres champs ici si nécessaire
      });
      print("Tontine créée avec succès.");
    } catch (e) {
      print("Erreur lors de la création de la tontine : $e");
    }
  }

  // Fonction pour récupérer une tontine spécifique depuis Firestore
  static Future<Tontine?> getTontine(String tontineId) async {
    try {
      DocumentSnapshot tontineSnapshot = await FirebaseFirestore.instance
          .collection("Tontines")
          .doc(tontineId)
          .get();
      if (tontineSnapshot.exists) {
        Map<String, dynamic> tontineData =
            tontineSnapshot.data() as Map<String, dynamic>;
        // Utilisez les données pour créer une instance de Tontine
        return Tontine(
          nom: tontineData["nom"],
          nombreParticipants: tontineData["nombreParticipants"],
          montantAAtteindre: tontineData["montantAAtteindre"],
          montantAVerser: tontineData["montantAVerser"],
          participantsId: [], // Vous devrez implémenter la récupération des participants ici
        );
      } else {
        print("Aucune tontine trouvée avec l'ID $tontineId.");
        return null;
      }
    } catch (e) {
      print("Erreur lors de la récupération de la tontine : $e");
      return null;
    }
  }

  // Fonction pour mettre à jour les données d'une tontine existante dans Firestore
  Future<void> updateTontine(
      String tontineId, Map<String, dynamic> updatedData) async {
    try {
      await FirebaseFirestore.instance
          .collection("Tontines")
          .doc(tontineId)
          .update(updatedData);
      print("Tontine mise à jour avec succès.");
    } catch (e) {
      print("Erreur lors de la mise à jour de la tontine : $e");
    }
  }

  // Fonction pour supprimer une tontine de Firestore
  static Future<void> deleteTontine(String tontineId) async {
    try {
      await FirebaseFirestore.instance
          .collection("Tontines")
          .doc(tontineId)
          .delete();
      print("Tontine supprimée avec succès.");
    } catch (e) {
      print("Erreur lors de la suppression de la tontine : $e");
    }
  }

  // Fonction pour récupérer toutes les tontines enregistrées dans Firestore
  static Future<List<Tontine>> getAllTontines() async {
    try {
      QuerySnapshot tontineQuery =
          await FirebaseFirestore.instance.collection("Tontines").get();
      List<Tontine> tontines = [];
      for (QueryDocumentSnapshot tontineDoc in tontineQuery.docs) {
        Map<String, dynamic> tontineData =
            tontineDoc.data() as Map<String, dynamic>;
        Tontine tontine = Tontine(
          nom: tontineData["nom"],
          nombreParticipants: tontineData["nombreParticipants"],
          montantAAtteindre: tontineData["montantAAtteindre"],
          montantAVerser: tontineData["montantAVerser"],
          participantsId: [], // Vous devrez implémenter la récupération des participants ici
        );
        tontines.add(tontine);
      }
      return tontines;
    } catch (e) {
      print("Erreur lors de la récupération des tontines : $e");
      return [];
    }
  }
}
