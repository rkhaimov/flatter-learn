import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final HandleSubmit handleSubmit;

  NewTransaction(this.handleSubmit);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final title = TextEditingController();
  final amount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: title,
              onSubmitted: (_) => submit,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amount,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submit,
            ),
            FlatButton(
              onPressed: submit,
              child: Text('Add transaction'),
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }

  void submit() {
    var parsed = double.tryParse(amount.text);

    if (title.text.isEmpty || parsed == null) {
      return;
    }

    widget.handleSubmit(title.text, parsed);

    Navigator.of(context).pop();
  }
}

typedef HandleSubmit = void Function(String title, double amount);
