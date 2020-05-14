import 'package:flutter/material.dart';
import './wtransaction.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Expenses',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      amount: 43.90,
      date: DateTime.now(),
      id: "1",
      title: "Pan Casero",
    ),
    Transaction(
      amount: 45,
      date: DateTime.now(),
      id: "2",
      title: "Lechuga Casero",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Expenses"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.green,
              child: Text("CHART"),
              elevation: 5,
            ),
          ),
          Column(
            children: <Widget>[
              ...getTransactions(),
            ],
          ),
        ],
      ),
    );
  }

  getTransactions() {
    var list = transactions.map((tx) {
      return WTransaction(
        amount: tx.amount,
        date: tx.date,
        title: tx.title,
      );
    }).toList();
    return list;
  }
}
