import 'package:flutter/material.dart';

final titleController = TextEditingController();
final amountController = TextEditingController();

class WTransactionInput extends StatelessWidget {
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
                        print("T: ${titleController.text}");
                        print("A: ${amountController.text}");
                      }),
                ],
              ),
            )));
  }
}
