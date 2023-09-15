import 'package:flutter/material.dart';
import 'package:wesika/composants/AppBar.dart';
import 'package:wesika/composants/ButtonWithIcon.dart';
import 'package:wesika/composants/TextField.dart';
import 'package:wesika/composants/TontineInfoCard.dart';
import 'package:wesika/composants/TontinesListWidget.dart';
import 'package:wesika/composants/drawer.dart';
import 'package:wesika/composants/popUpCreationTontine.dart';
import 'package:wesika/models/Tontine.dart';
import 'package:wesika/models/Users.dart';

import '../../composants/TransactionCards.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<UserData?> userData;

  @override
  void initState() {
    super.initState();
    userData = getUserData();
  }

  final TextEditingController nom = TextEditingController();
  final TextEditingController participants = TextEditingController();
  final TextEditingController montantAAtteindre = TextEditingController();
  final TextEditingController montantVerse = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: buildDrawer(context),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Créer une nouvelle tontine'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  createTextFieldWithIcon(
                                    'Nom de la tontine',
                                    'Nom de la tontine',
                                    Icons
                                        .ac_unit, // Remplacez par l'icône que vous souhaitez
                                    nom, // Utilisez le contrôleur de texte approprié
                                  ),
                                  createTextFieldWithIcon(
                                    'Nombre de participants',
                                    'Nombre de participants',
                                    Icons
                                        .people, // Remplacez par l'icône que vous souhaitez
                                    participants, // Utilisez le contrôleur de texte approprié
                                  ),
                                  createTextFieldWithIcon(
                                    'Montant à atteindre',
                                    'Montant à atteindre',
                                    Icons
                                        .monetization_on, // Remplacez par l'icône que vous souhaitez
                                    montantAAtteindre, // Utilisez le contrôleur de texte approprié
                                  ),
                                  createTextFieldWithIcon(
                                    'Montant à verser',
                                    'Montant à verser',
                                    Icons
                                        .attach_money, // Remplacez par l'icône que vous souhaitez
                                    montantVerse, // Utilisez le contrôleur de texte approprié
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Fermer le pop-up
                                  },
                                  child: Text('Annuler'),
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    Tontine nouvelleTontine = Tontine(
                                        nom: nom.text,
                                        nombreParticipant:
                                            num.tryParse(participants.text),
                                        montantAAtteindre: num.tryParse(
                                            montantAAtteindre.text),
                                        montantAVerser:
                                            num.tryParse(montantVerse.text),
                                        montantRecolte: 0);
                                    final user =
                                        await userData; // Attend la résolution de userData

                                    nouvelleTontine
                                        .createTontine(user!.userID!);
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Créer'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: Icon(
                        Icons.mail,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      label: const Text(
                        "Gmail",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    createButtonWithIcon(
                      onpressed: () {},
                      containerColor: Theme.of(context).colorScheme.primary,
                      context: context,
                      horizontal: 10,
                      vertical: 10,
                      texte: "Rejoindre",
                      couleurIcon: Theme.of(context).colorScheme.onPrimary,
                      couleurBtn: Theme.of(context).colorScheme.secondary,
                      Icone: Icon(Icons.add),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SingleChildScrollView(
                  reverse: true,
                  scrollDirection: Axis.horizontal,
                  child: TontinesListWidget(),
                ),
                SizedBox(height: 20),
                SingleChildScrollView(
                  child: TransactionHistoryWidget(
                    transactions: [
                      Transaction(
                        amount: 50.0,
                        date: '2023-08-15',
                        isVerified: true,
                      ),
                      Transaction(
                        amount: 30.0,
                        date: '2023-08-10',
                        isVerified: false,
                      ),
                      Transaction(
                        amount: 25.0,
                        date: '2023-08-05',
                        isVerified: true,
                      ),
                      Transaction(
                        amount: 50.0,
                        date: '2023-08-15',
                        isVerified: true,
                      ),
                      Transaction(
                        amount: 30.0,
                        date: '2023-08-10',
                        isVerified: false,
                      ),
                      Transaction(
                        amount: 25.0,
                        date: '2023-08-05',
                        isVerified: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
