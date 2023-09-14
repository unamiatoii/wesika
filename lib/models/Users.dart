import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserData {
  final String? userID;
  final String? dateNaissance;
  final String? email;
  final String? lieuResidence;
  final String? motDePasse;
  final String? nom;
  final String? numero;
  final String? prenom;
  final String? profession;
  final String? profileImageUrl;
  final String? rectoIdImageUrl;
  final String? versoIdImageUrl;

  UserData({
    this.userID,
    this.dateNaissance,
    this.email,
    this.lieuResidence,
    this.motDePasse,
    this.nom,
    this.numero,
    this.prenom,
    this.profession,
    this.profileImageUrl,
    this.rectoIdImageUrl,
    this.versoIdImageUrl,
  });

  factory UserData.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return UserData(
      userID: snapshot.id,
      dateNaissance: data['dateNaissance'] ?? '',
      email: data['email'] ?? '',
      lieuResidence: data['lieuResidence'] ?? '',
      motDePasse: data['motDePasse'] ?? '',
      nom: data['nom'] ?? '',
      numero: data['numero'] ?? '',
      prenom: data['prenom'] ?? '',
      profession: data['profession'] ?? '',
      profileImageUrl: data['profileImageUrl'] ?? '',
      rectoIdImageUrl: data['rectoIdImageUrl'] ?? '',
      versoIdImageUrl: data['versoIdImageUrl'] ?? '',
    );
  }
}

Future<UserData?> getUserData() async {
  try {
    User? actuelUser = FirebaseAuth.instance.currentUser;

    if (actuelUser != null) {
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection("Utilisateur")
          .doc(actuelUser.uid)
          .get();

      if (userSnapshot.exists) {
        UserData userData = UserData.fromSnapshot(userSnapshot);
        return userData;
      } else {
        print('Aucun document utilisateur trouvé pour cet utilisateur.');
        return null;
      }
    } else {
      print('Aucun utilisateur connecté.');
      return null;
    }
  } catch (e) {
    print('Erreur lors de la récupération des données de l\'utilisateur : $e');
    return null;
  }
}
