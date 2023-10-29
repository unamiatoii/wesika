import 'package:flutter/material.dart';

class TontineInfoWidget extends StatelessWidget {
  final String title;
  final num fondsRecolte;
  final num fondsARecolter;
  final num members;
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: Container(
          height: 250,
          width: 250,
          decoration: BoxDecoration(
            border: Border.all(width: 1.5),
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(12.0),
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
                    title.toUpperCase(),
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  Icon(
                    Icons.account_balance_wallet,
                    color: Theme.of(context).colorScheme.secondary,
                    size: 40,
                  )
                ],
              ),
              monspacer(),
              SizedBox(height: 8.0),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "$fondsRecolte ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  Text(
                    "/ ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Text("$fondsARecolter",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 30)),
                ],
              ),
            ],
          )),
    );
  }
}
