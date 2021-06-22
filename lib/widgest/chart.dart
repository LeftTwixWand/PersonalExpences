import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import '../widgest/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  double get totalSpending => groupedTransactionValues.fold(
      0.0, (sum, item) => sum + (item['amount'] as double));

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

        return {
          'day': DateFormat.E().format(weekDay).substring(0, 1),
          'amount': totalSum
        };
      });

  Chart(this.recentTransactions);

  @override
  Widget build(BuildContext context) => Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactionValues
                .map((data) => Flexible(
                      fit: FlexFit.tight,
                      child: ChartBar(
                          data['day'].toString(),
                          data['amount'] as double,
                          totalSpending == 0.0
                              ? 0.0
                              : (data['amount'] as double) / totalSpending),
                    ))
                .toList(),
          ),
        ),
      );
}
