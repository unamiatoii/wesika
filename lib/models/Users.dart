// ignore: file_names
class Users {
  String? userID;
  String? nom;
  String? email;
  String? adresse;
  String? numero;
  String? photoCniRecto;
  String? photoCniVerso;
  String? mdp;
  String? photoDeProfil;

  Users(
      {this.userID,
      this.nom,
      this.email,
      this.adresse,
      this.numero,
      this.photoCniRecto,
      this.photoCniVerso,
      this.photoDeProfil,
      this.mdp});

  factory Users.fromMap(Map<String, dynamic> data) {
    return Users(
      userID: data['userID'] ?? '',
      nom: data['nom'] ?? '',
      email: data['email'] ?? '',
      adresse: data['adresse'] ?? '',
      numero: data['numero'] ?? '',
      mdp: data['mdp'] ?? '',
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
      'mdp': mdp,
      'photoCniRecto': photoCniRecto,
      'photoCniVerso': photoCniVerso,
      'photoDeProfil': photoDeProfil,
    };
  }
}
