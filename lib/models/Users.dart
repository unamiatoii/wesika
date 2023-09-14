// ignore: file_names
class Users {
  String userID;
  String nom;
  String email;
  String adresse;
  String numero;
  String photoCniRecto;
  String photoCniVerso;
  String photoDeProfil; // Ajout de la propriété photoDeProfil

  Users({
    required this.userID,
    required this.nom,
    required this.email,
    required this.adresse,
    required this.numero,
    required this.photoCniRecto,
    required this.photoCniVerso,
    required this.photoDeProfil, // Initialisation de la propriété photoDeProfil
  });

  factory Users.fromMap(Map<String, dynamic> data) {
    return Users(
      userID: data['userID'] ?? '',
      nom: data['nom'] ?? '',
      email: data['email'] ?? '',
      adresse: data['adresse'] ?? '',
      numero: data['numero'] ?? '',
      photoCniRecto: data['photoCniRecto'] ?? '',
      photoCniVerso: data['photoCniVerso'] ?? '',
      photoDeProfil: data['photoDeProfil'] ??
          '', // Ajout de la récupération de la propriété photoDeProfil
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'nom': nom,
      'email': email,
      'adresse': adresse,
      'numero': numero,
      'photoCniRecto': photoCniRecto,
      'photoCniVerso': photoCniVerso,
      'photoDeProfil':
          photoDeProfil, 
    };
  }
}
