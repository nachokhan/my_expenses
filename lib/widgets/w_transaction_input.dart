import 'package:flutter/material.dart';

class WTransactionInput extends StatefulWidget {
  final Function onTxAdded;

  WTransactionInput(this.onTxAdded);

  @override
  _WTransactionInputState createState() => _WTransactionInputState();
}

class _WTransactionInputState extends State<WTransactionInput> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

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
                    onSubmitted: (_) => _addTransactionToList(),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: "Amount"),
                    controller: amountController,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    onSubmitted: (_) => _addTransactionToList(),
                  ),
                  FlatButton(
                      child: Text("Add Transaction"),
                      textColor: Theme.of(context).accentColor,
                      onPressed: () {
                        _addTransactionToList();
                        
                      }),
                ],
              ),
            )));
  }

  _addTransactionToList() {
    final title = titleController.text;
    final amount = double.parse(amountController.text);

    if (title.isEmpty || amount <= 0) {
      return;
    }

    widget.onTxAdded(title, amount);
    //FocusScope.of(context).unfocus();
    Navigator.of(context).pop();
  }
}
