import 'package:flutter/material.dart';

import './w_transaction.dart';
import '../models/transaction.dart';

class WTransactionList extends StatelessWidget {
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
      title: "Lechuga Casera",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ...getTransactions(),
      ],
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
