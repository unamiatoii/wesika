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

  factory Participant.fromMap(Map<String, dynamic> data) {
    return Participant(
      idUser: data['IdUser'] ?? 0,
      aJour: data['aJour'] ?? false,
      sonTour: data['sonTour'] ?? false,
      dejaRamasse: data['dejaRamasse'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'IdUser': idUser,
      'aJour': aJour,
      'sonTour': sonTour,
      'dejaRamasse': dejaRamasse,
    };
  }
}
