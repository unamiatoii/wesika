import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wesika/composants/Buttons.dart';
import 'package:wesika/composants/DateField.dart';
import 'package:wesika/composants/NextPage.dart';
import 'package:wesika/composants/TextField.dart';
import 'package:wesika/pages/mainPage/HomePage.dart';
import 'package:editable_image/editable_image.dart';
import 'package:image_picker/image_picker.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final TextEditingController emailModificationController =
      TextEditingController();
  final TextEditingController nameModificationController =
      TextEditingController();

  File? _profileImage;
  File? _rectoIdImage;
  File? _versoIdImage;
  final _defaultImage = Image.asset('assets/illustration_inscription.png');

  Future<File?> _takePhoto() async {
    File? Image;
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        Image = File(pickedFile.path);
      });
      return Image;
    }
    return null;
  }

  Widget buildRectoIdImage(File? image) {
    if (image != null) {
      // Si une image a été prise pour le recto de la pièce d'identité
      return Image.file(
        image, // Utilisez l'image du recto prise
        fit: BoxFit.fill, // Ajustez l'image à la taille du container
      );
    } else {
      return Center(
        child: Icon(
          Icons.camera_alt,
          size: 40,
          color: Colors.white,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  File? image = await _takePhoto();
                  if (image != null) {
                    setState(() {
                      _profileImage = image;
                    });
                  }
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipOval(
                      child: Container(
                        width: 150, // Largeur de l'image
                        height: 150, // Hauteur de l'image
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        child: buildRectoIdImage(_profileImage),
                      ),
                    ),
                    Icon(
                      Icons.photo_camera,
                      size: 40,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.all(10.0)),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          createDateFieldWithIcon(
                            "Date de naissance",
                            "Entrez votre date de naissance",
                            Icons.calendar_month,
                            nameModificationController,
                          ),
                          createTextFieldWithIcon(
                            "Profession",
                            "Entrez votre profession",
                            Icons.work,
                            emailModificationController,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          createTextFieldWithIcon(
                            "Lieu d'habitation",
                            "Entrez votre lieu d'habitation",
                            Icons.place,
                            nameModificationController,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    File? image = await _takePhoto();
                                    if (image != null) {
                                      setState(() {
                                        _rectoIdImage = image;
                                      });
                                    }
                                  },
                                  child: Container(
                                    width: 300, // Largeur de l'image
                                    height: 150, // Hauteur de l'image
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: _rectoIdImage !=
                                            null // Afficher l'image si elle existe
                                        ? buildRectoIdImage(_rectoIdImage)
                                        : Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.camera_alt,
                                                size: 40,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onPrimary,
                                              ),
                                              Text(
                                                "Touchez pour ajouter le recto de votre CNI",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onPrimary,
                                                ),
                                              ),
                                            ],
                                          ),
                                  ),
                                ),

                                SizedBox(
                                  width: 20,
                                ),
                                // Champ pour le verso de la pièce d'identité
                                GestureDetector(
                                  onTap: () async {
                                    File? image = await _takePhoto();
                                    if (image != null) {
                                      setState(() {
                                        _versoIdImage = image;
                                      });
                                    }
                                  },
                                  child: Container(
                                    width: 300, // Largeur de l'image
                                    height: 150, // Hauteur de l'image
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: _versoIdImage !=
                                            null // Afficher l'image si elle existe
                                        ? buildRectoIdImage(_versoIdImage)
                                        : Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.camera_alt,
                                                size: 40,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onPrimary,
                                              ),
                                              Text(
                                                "Touchez pour ajouter le recto de votre CNI",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onPrimary,
                                                ),
                                              ),
                                            ],
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.all(10.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    child: buttons(
                      onPressed: () {
                        // Naviguer vers la page souhaitée, par exemple MyHomePage
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage()),
                        );
                      },
                      bordercolor: Theme.of(context).colorScheme.onPrimary,
                      backcolor: Theme.of(context).colorScheme.secondary,
                      context: context,
                      height: 45,
                      width: 150,
                      texte: "TERMINER",
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
