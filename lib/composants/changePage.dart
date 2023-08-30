import 'package:flutter/material.dart';

changePage(BuildContext context, Widget nextPage) {
  return Navigator.push(
      context, MaterialPageRoute(builder: (context) => nextPage));
}

void validerInscription(
  TextEditingController nameController,
  TextEditingController surnameController,
  TextEditingController emailController,
  TextEditingController phoneNumberController,
  TextEditingController passwordController,
  TextEditingController confirmPasswordController,
  TextEditingController dateOfBirthController,
  TextEditingController addressController,
  TextEditingController occupationController,
  TextEditingController educationLevelController,
) {
  String name = nameController.text;
  String surname = surnameController.text;
  String email = emailController.text;
  String phoneNumber = phoneNumberController.text;
  String password = passwordController.text;
  String confirmPassword = confirmPasswordController.text;
  String dateOfBirth = dateOfBirthController.text;
  String address = addressController.text;
  String occupation = occupationController.text;
  String educationLevel = educationLevelController.text;

  // Faites ce que vous voulez avec les données (par exemple, imprimez-les)
  print('Nom complet: $name $surname');
  print('Email: $email');
  print('Numéro de téléphone: $phoneNumber');
  print('Mot de passe: $password');
  print('Confirmer le mot de passe: $confirmPassword');
  print('Date de naissance: $dateOfBirth');
  print('Adresse: $address');
  print('Profession: $occupation');
  print('Niveau d\'éducation: $educationLevel');
}
