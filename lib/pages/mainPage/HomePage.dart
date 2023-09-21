import 'package:flutter/material.dart';
import 'package:wesika/composants/ButtonWithIcon.dart';
import 'package:wesika/composants/NextPage.dart';
import 'package:wesika/composants/TontinesListWidget.dart';
import 'package:wesika/main.dart';
import 'package:wesika/models/Users.dart';
import 'package:wesika/pages/mainPage/NouvelleTontineWidget.dart';

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
                    createButtonWithIcon(
                      onpressed: () {
                        changePage(
                            context, Home(nextPage: NouvelleTontineWidget()));
                      },
                      containerColor: Theme.of(context).colorScheme.primary,
                      context: context,
                      horizontal: 10,
                      vertical: 10,
                      texte: "Nouvelle",
                      couleurIcon: Theme.of(context).colorScheme.onPrimary,
                      couleurBtn: Theme.of(context).colorScheme.secondary,
                      Icone: Icon(Icons.add),
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
