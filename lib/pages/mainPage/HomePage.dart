import 'package:flutter/material.dart';
import 'package:wesika/composants/ButtonWithIcon.dart';
import 'package:wesika/composants/TontineInfoCard.dart';

import '../../composants/TransactionCards.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text('Ma Page d\'Accueil'),
      ),
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
                    child: Row(
                      children: [
                        TontineInfoWidget(
                          title: "Tontine Willy",
                          fondsARecolter: 1000000,
                          fondsRecolte: 25000,
                          date: "date",
                          members: 10,
                          isTransactionValid: false,
                        ),
                        TontineInfoWidget(
                          title: "Tontine Willy",
                          fondsARecolter: 1000000,
                          fondsRecolte: 25000,
                          date: "date",
                          members: 10,
                          isTransactionValid: false,
                        ),
                        TontineInfoWidget(
                          title: "Tontine Willy",
                          fondsARecolter: 1000000,
                          fondsRecolte: 25000,
                          date: "date",
                          members: 10,
                          isTransactionValid: true,
                        ),
                        TontineInfoWidget(
                          title: "Tontine Willy",
                          fondsARecolter: 1000000,
                          fondsRecolte: 25000,
                          date: "date",
                          members: 10,
                          isTransactionValid: true,
                        ),
                        TontineInfoWidget(
                          title: "Tontine Willy",
                          fondsARecolter: 1000000,
                          fondsRecolte: 25000,
                          date: "date",
                          members: 10,
                          isTransactionValid: false,
                        ),
                      ],
                    ),
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
                ]),
          ),
        ),
      ),
    );
  }
}
