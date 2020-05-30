import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WTransaction extends StatelessWidget {
  final String title;
  final double amount;
  final DateTime date;
  final Function onDeleteTx;

  WTransaction(
      {@required this.amount,
      @required this.date,
      @required this.title,
      @required this.onDeleteTx});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          WAmount("\$ ${amount.toStringAsFixed(2)}"),
          WTitleDate(title, date),
          WDeleteIcon(onDeleteTx),
        ],
      ),
    );
  }
}

class WDeleteIcon extends StatelessWidget {
  final Function onPressed;
  WDeleteIcon(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 200,
      child: IconButton(
        icon: Icon(Icons.delete),
        onPressed: onPressed,
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
              fontSize: 16,
            ),
          ),
          Text(
            DateFormat("d MMMM").format(date),
            style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
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
      width: 110,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Theme.of(context).accentColor,
          width: 2,
          style: BorderStyle.solid,
        ),
      ),
      child: Text(
        amount,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.black,
        ),
        textAlign: TextAlign.right,
      ),
    );
  }
}
