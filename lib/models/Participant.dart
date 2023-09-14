import 'package:cloud_firestore/cloud_firestore.dart';

class Participant {
  int idUser;
  bool aJour;
  bool sonTour;
  bool dejaRamasse;

  Participant({
    required this.idUser,
    required this.aJour,
    required this.sonTour,
    required this.dejaRamasse,
  });

  // Fonction pour ajouter un nouveau participant à une tontine spécifique
  Future<void> addToTontine(String tontineId) async {
    try {
      await FirebaseFirestore.instance
          .collection("Tontines")
          .doc(tontineId)
          .collection("Participants")
          .doc(idUser.toString())
          .set({
        "aJour": aJour,
        "sonTour": sonTour,
        "dejaRamasse": dejaRamasse,
        // Ajoutez d'autres champs ici si nécessaire
      });
      print("Participant ajouté à la tontine avec succès.");
    } catch (e) {
      print("Erreur lors de l'ajout du participant à la tontine : $e");
    }
  }

  // Fonction pour récupérer un participant spécifique dans une tontine
  static Future<Participant?> getParticipantInTontine(
      String tontineId, int userId) async {
    try {
      DocumentSnapshot participantSnapshot = await FirebaseFirestore.instance
          .collection("Tontines")
          .doc(tontineId)
          .collection("Participants")
          .doc(userId.toString())
          .get();
      if (participantSnapshot.exists) {
        Map<String, dynamic> participantData =
            participantSnapshot.data() as Map<String, dynamic>;
        return Participant(
          idUser: userId,
          aJour: participantData["aJour"],
          sonTour: participantData["sonTour"],
          dejaRamasse: participantData["dejaRamasse"],
        );
      } else {
        print("Aucun participant trouvé dans la tontine $tontineId pour l'utilisateur $userId.");
        return null;
      }
    } catch (e) {
      print("Erreur lors de la récupération du participant : $e");
      return null;
    }
  }

  // Fonction pour mettre à jour les données d'un participant dans une tontine
  Future<void> updateParticipantInTontine(String tontineId) async {
    try {
      await FirebaseFirestore.instance
          .collection("Tontines")
          .doc(tontineId)
          .collection("Participants")
          .doc(idUser.toString())
          .update({
        "aJour": aJour,
        "sonTour": sonTour,
        "dejaRamasse": dejaRamasse,
        // Ajoutez d'autres champs ici si nécessaire
      });
      print("Données du participant mises à jour avec succès.");
    } catch (e) {
      print("Erreur lors de la mise à jour des données du participant : $e");
    }
  }

  // Fonction pour supprimer un participant d'une tontine
  Future<void> removeFromTontine(String tontineId) async {
    try {
      await FirebaseFirestore.instance
          .collection("Tontines")
          .doc(tontineId)
          .collection("Participants")
          .doc(idUser.toString())
          .delete();
      print("Participant supprimé de la tontine avec succès.");
    } catch (e) {
      print("Erreur lors de la suppression du participant de la tontine : $e");
    }
  }

  // Fonction pour récupérer tous les participants d'une tontine
  static Future<List<Participant>> getAllParticipantsInTontine(
      String tontineId) async {
    try {
      QuerySnapshot participantsQuery = await FirebaseFirestore.instance
          .collection("Tontines")
          .doc(tontineId)
          .collection("Participants")
          .get();
      List<Participant> participants = [];
      for (QueryDocumentSnapshot participantDoc in participantsQuery.docs) {
        Map<String, dynamic> participantData =
            participantDoc.data() as Map<String, dynamic>;
        int userId = int.tryParse(participantDoc.id) ?? 0;
        Participant participant = Participant(
          idUser: userId,
          aJour: participantData["aJour"],
          sonTour: participantData["sonTour"],
          dejaRamasse: participantData["dejaRamasse"],
        );
        participants.add(participant);
      }
      return participants;
    } catch (e) {
      print("Erreur lors de la récupération des participants de la tontine : $e");
      return [];
    }
  }
}
