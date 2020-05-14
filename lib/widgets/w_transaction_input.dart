import 'package:flutter/material.dart';

class WTransactionInput extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function onTxAdded;

  WTransactionInput(this.onTxAdded);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: "Title"),
                    controller: titleController,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: "Amount"),
                    controller: amountController,
                  ),
                  FlatButton(
                      child: Text("Add Transaction"),
                      textColor: Colors.purple,
                      onPressed: () {
                        onTxAdded(
                          titleController.text,
                          double.parse(amountController.text),
                        );
                      }),
                ],
              ),
            )));
  }
}
