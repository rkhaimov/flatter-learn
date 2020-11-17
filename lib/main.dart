import 'package:first_app/models/transaction.dart';
import 'package:first_app/widgets/chart.dart';
import 'package:first_app/widgets/new_transaction.dart';
import 'package:first_app/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal expenses',
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          accentColor: Colors.orangeAccent,
          fontFamily: 'OpenSans',
          textTheme: ThemeData.light()
              .textTheme
              .copyWith(headline6: TextStyle(fontSize: 16)),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  headline6:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20)))),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 78.99, date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Weekly Groceries',
        amount: 17.22,
        date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal expenses'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => openAddTransactionForm(context))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Chart(transactions),
            TransactionList(transactions)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => openAddTransactionForm(context)),
    );
  }

  openAddTransactionForm(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builderContext) {
          return NewTransaction(add);
        });
  }

  add(String title, double amount) {
    final transaction = new Transaction(
        title: title,
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      transactions.add(transaction);
    });
  }
}
