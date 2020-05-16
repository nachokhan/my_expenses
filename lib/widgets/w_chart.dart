import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_expenses/models/transaction.dart';
import '../models/chartInfo.dart';

class WChart extends StatelessWidget {
  final List<Transaction> txs;

  WChart(this.txs);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(7),
      elevation: 6,
      child: Row(
        children: <Widget>[
          ...createWeekDays(),
        ],
      ),
    );
  }

  createWeekDays() {
    List<Widget> bars = [];

    final amounts = ChartInfo().fillFromLastDays(txs, 7);

    amounts.forEach((key, value) {
      final dia = DateFormat.E().format(DateTime.now().subtract(Duration(days: key)));

      bars.add(WBar(dia, value));
      bars.add(SizedBox(
        width: 15,
        height: 90,
      ));
    });

    return bars;
  }
}

class WBar extends StatelessWidget {
  final String day;
  final double amount;

  WBar(this.day, this.amount);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text("\$"),
          Text(amount.toString()),
          Text(day),
        ],
      ),
    );
  }
}
