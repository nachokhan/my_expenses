import 'package:flutter/material.dart';

import './w_transaction.dart';
import '../models/transaction.dart';

class WTransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  WTransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text("No transaction yet!"),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  child: Image.asset("assets/images/agotado.png",
                      fit: BoxFit.cover),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (BuildContext ctx, int index) {
                return Container(
                  child: getTransactionAt(index),
                );
              },

              /*ALTERNATIVE to ListView.builder()

        child: ListView(        
        children: <Widget>[
             ...getTransactionsList(),
        ],
        */
            ),
    );
  }

  /// This methods throws only one transaction based on
  /// the passed index. It will be automatically called by
  /// flutter when using ListView.builder() cause builder()
  /// knows exactly which indexes has to build/paint/render
  Widget getTransactionAt(int index) {
    return Container(
      child: WTransaction(
        amount: transactions[index].amount,
        date: transactions[index].date,
        title: transactions[index].title,
      ),
    );
  }

  /// I Created this function to use inside a ListView
  /// or a Column (although Column not recommended)
  /// because it throws a complete list of WTransactions.
  getTransactionsList() {
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
