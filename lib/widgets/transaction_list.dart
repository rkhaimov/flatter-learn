import 'package:first_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    if (transactions.isEmpty) {
      return Column(children: [
        Text('No transaction added yet!',
            style: Theme.of(context).textTheme.headline6),
        SizedBox(
          height: 50,
        ),
        SizedBox(
            height: 200,
            child: Image.asset(
              'assets/images/waiting.png',
              fit: BoxFit.cover,
            ))
      ]);
    }

    return Column(
      children: [
        for (var transaction in transactions)
          Card(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).primaryColor, width: 2)),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '\$${transaction.amount.toStringAsFixed(2)}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        DateFormat.yMMMd().format(transaction.date),
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
      ],
    );
  }
}
