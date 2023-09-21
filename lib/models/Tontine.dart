import 'package:cloud_firestore/cloud_firestore.dart';

class Tontine {
  String? id;
  String nom;
  num montantAAtteindre;
  num montantRecolte;
  num? nombreParticipants;
  num montantAVerser;
  num? periodePaiement;
  num? periodeRetrait;
  List<String?> participants;

  Tontine({
    this.id,
    required this.nom,
    required this.montantAAtteindre,
    this.montantRecolte = 0,
    required this.nombreParticipants,
    required this.montantAVerser,
    required this.periodePaiement,
    required this.periodeRetrait,
    required this.participants,
    int? nombreParticipant,
  });

  Map<String, dynamic> toMap() {
    return {
      'nom': nom,
      'montantAAtteindre': montantAAtteindre,
      'montantRecolte': montantRecolte,
      'nombreParticipants': nombreParticipants,
      'montantAVerser': montantAVerser,
      'periodePaiement': periodePaiement,
      'periodeRetrait': periodeRetrait,
      'participants': participants,
    };
  }

  factory Tontine.fromMap(Map<String, dynamic> map) {
    return Tontine(
      id: map['id'],
      nom: map['nom'],
      montantAAtteindre: map['montantAAtteindre'],
      montantRecolte: map['montantRecolte'],
      nombreParticipants: map['nombreParticipants'],
      montantAVerser: map['montantAVerser'],
      periodePaiement: map['periodePaiement'],
      periodeRetrait: map['periodeRetrait'],
      participants: List<String>.from(map['participants'] ?? []),
    );
  }

  Future<void> createTontine(String creatorId) async {
    try {
      participants.add(creatorId);

      await FirebaseFirestore.instance.collection("Tontine").add(toMap());
      print("Tontine créée avec succès.");
    } catch (e) {
      print("Erreur lors de la création de la tontine : $e");
    }
  }

  static Future<Tontine?> getTontine(String tontineId) async {
    try {
      DocumentSnapshot tontineSnapshot = await FirebaseFirestore.instance
          .collection("Tontine")
          .doc(tontineId)
          .get();
      if (tontineSnapshot.exists) {
        Map<String, dynamic> tontineData =
            tontineSnapshot.data() as Map<String, dynamic>;
        return Tontine.fromMap(tontineData);
      } else {
        print("Aucune tontine trouvée avec l'ID $tontineId.");
        return null;
      }
    } catch (e) {
      print("Erreur lors de la récupération de la tontine : $e");
      return null;
    }
  }

  Future<void> updateTontine(Map<String, dynamic> updatedData) async {
    try {
      await FirebaseFirestore.instance
          .collection("Tontine")
          .doc(id)
          .update(updatedData);
      print("Tontine mise à jour avec succès.");
    } catch (e) {
      print("Erreur lors de la mise à jour de la tontine : $e");
    }
  }

  Future<void> deleteTontine() async {
    try {
      await FirebaseFirestore.instance.collection("Tontine").doc(id).delete();
      print("Tontine supprimée avec succès.");
    } catch (e) {
      print("Erreur lors de la suppression de la tontine : $e");
    }
  }

  static Future<List<Tontine>> getAllTontines() async {
    try {
      QuerySnapshot tontineQuery =
          await FirebaseFirestore.instance.collection("Tontine").get();
      List<Tontine> tontines = [];
      for (QueryDocumentSnapshot tontineDoc in tontineQuery.docs) {
        Map<String, dynamic> tontineData =
            tontineDoc.data() as Map<String, dynamic>;
        tontines.add(Tontine.fromMap(tontineData));
      }
      return tontines;
    } catch (e) {
      print("Erreur lors de la récupération des Tontines : $e");
      return [];
    }
  }

  Future<void> addParticipant(String participantId) async {
    try {
      participants.add(participantId);
      await FirebaseFirestore.instance
          .collection("Tontine")
          .doc(id)
          .update({"participants": participants});
      print("Participant ajouté avec succès à la tontine $nom.");
    } catch (e) {
      print("Erreur lors de l'ajout du participant à la tontine : $e");
    }
  }

  double calculateTotalAmount() {
    // Implémentez la logique pour calculer le montant total récolté ici
    double total = 0;
    // Utilisez la liste des participants et les montants versés
    // pour calculer le montant total récolté.
    return total;
  }
}
