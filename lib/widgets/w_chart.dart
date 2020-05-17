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
      margin: EdgeInsets.all(3),
      elevation: 6,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            ...createWeekDays(),
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

    for (int dayCounter = 0; dayCounter < 7; dayCounter++) {
      var currentDate = DateTime.now().subtract(Duration(days: dayCounter));

      final dia = DateFormat.E().format(currentDate);

      // The idea behind 7-dayCounter is to use it in "reverse"
      final percentage = totalAmount != 0
          ? (amounts[(7 - dayCounter)] / totalAmount * 100).round()
          : 0;

      bars.add(WBar(dia, percentage, amounts[7 - dayCounter]));
      bars.add(SizedBox(
        width: 10,
        height: 110,
      ));
    }
    return bars;
  }
}

class WBar extends StatelessWidget {
  final String day;
  final int percentage;
  final double amount;
  final tHeight = 110;
  final width = 28.0;

  WBar(this.day, this.percentage, this.amount);

  @override
  Widget build(BuildContext context) {
    final hBox2 = (tHeight * (percentage) / 100);
    final hBox1 = tHeight - hBox2;
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
                  color: Colors.green,
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
