import 'package:flutter/material.dart';
import './w_transaction_input.dart';
import './w_transaction_list.dart';

class WJoiner extends StatefulWidget {
  @override
  _WJoinerState createState() => _WJoinerState();
}

class _WJoinerState extends State<WJoiner> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[        
        WTransactionInput(),
        WTransactionList(),
      ],
    ));
  }
}
