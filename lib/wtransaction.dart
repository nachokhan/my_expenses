import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WTransaction extends StatelessWidget {
  final String title;
  final double amount;
  final DateTime date;

  WTransaction({
    @required this.amount,
    @required this.date,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          WAmount("\$ $amount"),
          WTitleDate(title, date),
        ],
      ),
    );
  }
}

class WTitleDate extends StatelessWidget {
  final String title;
  final DateTime date;

  WTitleDate(this.title, this.date);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(
            DateFormat("d MMMM").format(date),
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class WAmount extends StatelessWidget {
  final String amount;

  WAmount(this.amount);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.purple,
          width: 3,
          style: BorderStyle.solid,
        ),
      ),
      child: Text(
        amount,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.purple,
        ),
        // textAlign: TextAlign.center,
      ),
    );
  }
}
