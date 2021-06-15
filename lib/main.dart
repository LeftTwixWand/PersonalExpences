import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App1',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction('t1', 'New Shoes', 69.99, DateTime.now()),
    Transaction('t2', 'Weekly Groceries', 16.53, DateTime.now()),
  ];

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Flutter app'),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Card(
                  color: Colors.blue,
                  child: Text('Chart!'),
                ),
              ),
              Card(
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
                          print(titleController.text);
                          print(amountController.text);
                        },
                        child: Text('Add Tpansaction'),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: transactions
                    .map(
                      (transaction) => Card(
                        child: Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.purple, width: 2),
                              ),
                              child: Text(
                                '\$${transaction.amount}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.purple,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  transaction.title,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  DateFormat.yMMMd().format(transaction.date),
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ]),
      );
}
