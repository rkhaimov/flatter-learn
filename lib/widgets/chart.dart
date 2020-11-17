import 'package:first_app/models/transaction.dart';
import 'package:first_app/widgets/chart_bar.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  Chart(this.recentTransactions);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (var transaction in transactionsByDays)
              ChartBar(
                transaction.day,
                transaction.amount,
                totalSpending == 0.0 ? 0.0 : transaction.amount / totalSpending,
              )
          ],
        ),
      ),
    );
  }

  final List<Transaction> recentTransactions;

  double get totalSpending {
    return transactionsByDays.fold(
        0.0, (previousValue, element) => previousValue + element.amount);
  }

  List<TransactionValue> get transactionsByDays {
    return List<TransactionValue>.generate(7, (index) {
      final transactionValueDate =
          DateTime.now().subtract(Duration(days: index));
      var total = 0.0;

      for (var transaction in recentTransactions) {
        // Check only days for now
        if (transaction.date.day == transactionValueDate.day) {
          total += transaction.amount;
        }
      }

      return TransactionValue(
          DateFormat.E().format(transactionValueDate).substring(0, 1), total);
    });
  }
}

class TransactionValue {
  String day;
  double amount;

  TransactionValue(this.day, this.amount);
}
