import 'package:flutter/material.dart';
import './widgest/new_transaction.dart';
import './widgest/transaction_list.dart';
import './models/transaction.dart';

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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction('t1', 'New Shoes', 69.99, DateTime.now()),
    Transaction('t2', 'Weekly Groceries', 16.53, DateTime.now()),
  ];

  void _addNewTransaction(String transactionTitle, double transactionAmount) {
    final newTransaction = Transaction(DateTime.now().toString(),
        transactionTitle, transactionAmount, DateTime.now());

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx, builder: (_) => NewTransaction(_addNewTransaction));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Flutter app'),
          actions: <Widget>[
            IconButton(
                onPressed: () => _startAddNewTransaction(context),
                icon: Icon(Icons.add)),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  child: Card(
                    color: Colors.blue,
                    child: Text('Chart!'),
                  ),
                ),
                TransactionList(_userTransactions),
              ]),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.access_alarm),
          onPressed: () => _startAddNewTransaction(context),
        ),
      );
}
