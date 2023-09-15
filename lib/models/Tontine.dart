import 'package:cloud_firestore/cloud_firestore.dart';

class Tontine {
  String nom;
  num? nombreParticipant;
  num? montantAAtteindre;
  num? montantAVerser;
  num? montantRecolte; // Nouvel attribut montantRecolte
  List<String> participants;

  Tontine({
    required this.nom,
    required this.nombreParticipant,
    required this.montantAAtteindre,
    required this.montantAVerser,
    required this.montantRecolte,
  }) : participants = [];

  //
  Future<void> createTontine(String creatorId) async {
    try {
      
      participants.add(creatorId);

      await FirebaseFirestore.instance.collection("Tontine").add({
        "nom": nom,
        "nombreParticipant": nombreParticipant,
        "montantAAtteindre": montantAAtteindre,
        "montantAVerser": montantAVerser,
        "montantRecolte": montantRecolte,
        "participants": participants, // Ajout de l'ID du créateur
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
      DocumentSnapshot Tontinesnapshot = await FirebaseFirestore.instance
          .collection("Tontine")
          .doc(tontineId)
          .get();
      if (Tontinesnapshot.exists) {
        Map<String, dynamic> tontineData =
            Tontinesnapshot.data() as Map<String, dynamic>;
        // Utilisez les données pour créer une instance de Tontine
        return Tontine(
          nom: tontineData["nom"],
          nombreParticipant: tontineData["nombreParticipant"],
          montantAAtteindre: tontineData["montantAAtteindre"],
          montantAVerser: tontineData["montantAVerser"],
          montantRecolte:
              tontineData["montantRecolte"], // Ajout de montantRecolte
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
          .collection("Tontine")
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
          .collection("Tontine")
          .doc(tontineId)
          .delete();
      print("Tontine supprimée avec succès.");
    } catch (e) {
      print("Erreur lors de la suppression de la tontine : $e");
    }
  }

  // Fonction pour récupérer toutes les Tontines enregistrées dans Firestore
  static Future<List<Tontine>> getAllTontines() async {
    try {
      QuerySnapshot tontineQuery =
          await FirebaseFirestore.instance.collection("Tontine").get();
      List<Tontine> Tontines = [];
      for (QueryDocumentSnapshot tontineDoc in tontineQuery.docs) {
        Map<String, dynamic> tontineData =
            tontineDoc.data() as Map<String, dynamic>;
        Tontine tontine = Tontine(
          nom: tontineData["nom"],
          nombreParticipant: tontineData["nombreParticipant"],
          montantAAtteindre: tontineData["montantAAtteindre"],
          montantAVerser: tontineData["montantAVerser"],
          montantRecolte: tontineData["montantRecolte"],
        );
        Tontines.add(tontine);
      }
      return Tontines;
    } catch (e) {
      print("Erreur lors de la récupération des Tontines : $e");
      return [];
    }
  }
}
