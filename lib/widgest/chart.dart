import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  List<Map<String, Object>> get groupedTransactionValues =>
      List.generate(7, (index) {
        final weekDay = DateTime.now().subtract(Duration(days: index));
        double totalSum = 0;

        for (var i = 0; i < recentTransactions.length; i++) {
          if (recentTransactions[i].date.month == weekDay.month &&
              recentTransactions[i].date.day == weekDay.day &&
              recentTransactions[i].date.year == weekDay.year) {
            totalSum += recentTransactions[i].amount;
          }
        }

        return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
      });

  Chart(this.recentTransactions);

  @override
  Widget build(BuildContext context) => Card(
        elevation: 6,
        margin: EdgeInsets.all(1),
        child: Row(
          children: [],
        ),
      );
}
