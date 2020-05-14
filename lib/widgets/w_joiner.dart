import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './w_transaction_input.dart';
import './w_transaction_list.dart';

class WJoiner extends StatefulWidget {
  @override
  _WJoinerState createState() => _WJoinerState();
}

class _WJoinerState extends State<WJoiner> {
  final List<Transaction> transactions = [
    Transaction(
      amount: 43.90,
      date: DateTime.now(),
      id: "1",
      title: "Pancito Casero",
    ),
    Transaction(
      amount: 45,
      date: DateTime.now(),
      id: "2",
      title: "Lechugon",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        WTransactionInput(addNewTransaction),
        WTransactionList(transactions),
      ],
    ));
  }

  addNewTransaction(String title, double amount) {
    setState(() {
      transactions.add(Transaction(
        amount: amount,
        title: title,
        date: DateTime.now(),
        id: DateTime.now().toString(),
      ));
    });
  }
}
