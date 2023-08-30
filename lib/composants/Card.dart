import 'package:flutter/material.dart';

Widget card() {
  String projet = 'Vente de volaille';
  int fonds = 10000;
  return Container(
    height: 150,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 73, 10, 115),
          Colors.purple,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      projet,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '$fonds FCFA',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Image.asset(
                'assets/chart.png',
                width: 90,
                height: 70,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ],
    ),
  );
}
