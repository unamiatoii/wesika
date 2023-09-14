import 'package:wesika/models/ParticipantTontines.dart';

class Groupe {
  String nom;
  int nombreParticipants;
  double montantAAtteindre;
  double montantAVerser;
  List<Participant> participants;

  Groupe({
    required this.nom,
    required this.nombreParticipants,
    required this.montantAAtteindre,
    required this.montantAVerser,
    required this.participants,
  });

  factory Groupe.fromMap(Map<String, dynamic> data) {
    List<Participant> participants = [];
    if (data['participants'] != null) {
      for (var participantData in data['participants']) {
        participants.add(Participant.fromMap(participantData));
      }
    }

    return Groupe(
      nom: data['nom'] ?? '',
      nombreParticipants: data['nombreParticipants'] ?? 0,
      montantAAtteindre: data['montantAAtteindre'] ?? 0.0,
      montantAVerser: data['montantAVerser'] ?? 0.0,
      participants: participants,
    );
  }

  Map<String, dynamic> toMap() {
    List<Map<String, dynamic>> participantList = [];
    for (var participant in participants) {
      participantList.add(participant.toMap());
    }

    return {
      'nom': nom,
      'nombreParticipants': nombreParticipants,
      'montantAAtteindre': montantAAtteindre,
      'montantAVerser': montantAVerser,
      'participants': participantList,
    };
  }
}
