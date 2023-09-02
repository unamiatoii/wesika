// // Importez le plugin Firebase Auth
// import 'package:firebase_auth/firebase_auth.dart';

// // Créez les méthodes d'authentification
// Future<void> signInWithEmailAndPassword(
//     String email, String password) async {
//   try {
//     // Authentifie l'utilisateur avec son adresse e-mail et son mot de passe
//     final user = await FirebaseAuth.instance
//         .signInWithEmailAndPassword(email: email, password: password);

//     // L'utilisateur est authentifié
//   } catch (error) {
//     // Une erreur s'est produite
//     print(error);
//   }
// }

// Future<void> signInWithGoogle() async {
//   try {
//     // Authentifie l'utilisateur avec son compte Google
//     final googleUser = await GoogleSignIn().signIn();
//     final authentication = await googleUser?.authentication;
//     final credential = GoogleAuthProvider.credential(
//         accessToken: authentication?.accessToken,
//         idToken: authentication?.idToken);
//     final user = await FirebaseAuth.instance.signInWithCredential(credential);

//     // L'utilisateur est authentifié
//   } catch (error) {
//     // Une erreur s'est produite
//     print(error);
//   }
// }

// // Appelez les méthodes d'authentification lorsque l'utilisateur appuie sur les boutons de connexion correspondants


// if (_emailController.text.isNotEmpty &&
//     _passwordController.text.isNotEmpty) {
//   signInWithEmailAndPassword(_emailController.text, _passwordController.text);
// }

// // Authentification avec compte Google
// _handleGoogleSignIn();
