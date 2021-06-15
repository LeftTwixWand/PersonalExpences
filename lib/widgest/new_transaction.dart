import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTransactionCallback;

  NewTransaction(this.addTransactionCallback);

  @override
  Widget build(BuildContext context) => Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
              ),
              TextButton(
                onPressed: () {
                  addTransactionCallback(titleController.text,
                      double.parse(amountController.text));
                },
                child: Text('Add Tpansaction'),
              ),
            ],
          ),
        ),
      );
}
