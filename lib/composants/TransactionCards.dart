import 'package:flutter/material.dart';

class TransactionHistoryWidget extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionHistoryWidget({required this.transactions});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: transactions.map((transaction) {
          return TransactionCard(transaction: transaction);
        }).toList(),
      ),
    );
  }
}

class TransactionCard extends StatelessWidget {
  final Transaction transaction;

  TransactionCard({required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        border: Border.all(color: Theme.of(context).colorScheme.onPrimary),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: Theme.of(context).colorScheme.secondary,
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                mini: false,
                heroTag: null,
                child: Icon(
                  size: 35,
                  Icons.payment,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Paiement de cotisation',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                  Text(
                    'Montant: \$${transaction.amount.toStringAsFixed(2)}', // Montant de la transaction
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                  Text(
                    'Date: ${transaction.date}', // Date de la transaction
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ],
              ),
              const Spacer(),
              transaction.isVerified
                  ? const Icon(
                      Icons.check,
                      color: Colors.green,
                      size: 30,
                    )
                  : const Icon(
                      Icons.cancel_outlined,
                      color: Colors.red,
                      size: 30,
                    )
            ],
          ),
        ],
      ),
    );
  }
}

class Transaction {
  final double amount;
  final String date;
  final bool
      isVerified; // Propriété pour indiquer si la transaction est validée ou non

  Transaction(
      {required this.amount, required this.date, required this.isVerified});
}
