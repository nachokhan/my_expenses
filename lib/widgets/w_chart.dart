import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import '../models/chartInfo.dart';
import 'w_bar.dart';

class WChart extends StatelessWidget {
  final List<Transaction> txs;

  WChart(this.txs);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(3),
      elevation: 6,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Text(
              "Your outcomes in the last 7 days:",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 5),
            Row(children: <Widget>[...createWeekDays()]),
          ],
        ),
      ),
    );
  }

  createWeekDays() {
    List<Widget> bars = [];

    final amounts = ChartInfo().fillFromLastDays(txs, 7);
    var totalAmount = 0.0;

    amounts.forEach((key, value) {
      totalAmount += value;
    });

    amounts.forEach((key, value) {
      var currentDate = DateTime.now().subtract(Duration(days: key - 1));

      final dia = DateFormat.E().format(currentDate);

      final percentage =
          totalAmount != 0 ? (value / totalAmount * 100).round() : 0;

      bars.add(WBar(dia, percentage, value));
      bars.add(SizedBox(width: 10, height: 110));
    });

    return bars;
  }
}
