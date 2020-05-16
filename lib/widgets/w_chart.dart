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
    var totalAmount = 0.0;

    amounts.forEach((key, value) {
      totalAmount += value;
    });

    amounts.forEach((key, value) {
      final dia =
          DateFormat.E().format(DateTime.now().subtract(Duration(days: key)));
      final percentage = (value / totalAmount * 100).round();

      bars.add(WBar(dia, percentage, value));
      bars.add(SizedBox(
        width: 10,
        height: 110,
      ));
    });

    return bars;
  }
}

class WBar extends StatelessWidget {
  final String day;
  final int percentage;
  final double amount;
  double hBox1, hBox2;
  final tHeight = 110;
  final width = 35.0;

  WBar(this.day, this.percentage, this.amount) {
    hBox2 = (tHeight * (percentage) / 100);
    hBox1 = tHeight - hBox2;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            width: width,
            height: hBox1,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  )),
            ),
          ),
          SizedBox(
            width: width,
            height: hBox2,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  )),
            ),
          ),
          Text('\$' + amount.toString()),
          Text(day),
        ],
      ),
    );
  }
}
