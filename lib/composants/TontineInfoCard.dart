import 'package:flutter/material.dart';

class TontineInfoWidget extends StatelessWidget {
  final String title;
  final int fondsRecolte;
  final int fondsARecolter;
  final int members;
  TontineInfoWidget({
    required this.title,
    required this.fondsARecolter,
    required this.fondsRecolte,
    required this.members,
  });

  Widget monspacer() {
    return const SizedBox(height: 8);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "$fondsRecolte / $fondsARecolter",
                    style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                  SizedBox(height: 8.0),
                  SizedBox(height: 8.0),
                  Text('Membres: $members'),
                  SizedBox(height: 8.0),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Fermer'),
                ),
              ],
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        child: Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color:
                      Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    Icon(
                      Icons.account_balance_wallet,
                      color: Theme.of(context).colorScheme.onPrimary,
                      size: 40,
                    )
                  ],
                ),
                monspacer(),
                SizedBox(height: 8.0),
                SizedBox(height: 8.0),
                Text(
                  'Membres: $members',
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "$fondsRecolte ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    Text("/",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30)),
                    Text("$fondsARecolter",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30)),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
