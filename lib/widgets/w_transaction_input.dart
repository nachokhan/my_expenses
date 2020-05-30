import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WTransactionInput extends StatefulWidget {
  final Function onTxAdded;

  WTransactionInput(this.onTxAdded);

  @override
  _WTransactionInputState createState() => _WTransactionInputState();
}

class _WTransactionInputState extends State<WTransactionInput> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  DateTime _pickedDate;

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
                  Row(
                    children: <Widget>[
                      _pickedDate == null
                          ? Text("No date chosen")
                          : Text(DateFormat.yMEd().format(_pickedDate)),
                      FlatButton(
                        child: Text("Choose date"),
                        onPressed: () => _showDateTimePicker(context),
                      ),
                    ],
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

  _showDateTimePicker(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((value) {
      setState(() {
        _pickedDate = value;
      });
    });
  }

  _addTransactionToList() {
    final title = titleController.text;
    final amount = double.parse(amountController.text);

    if (title.isEmpty || amount <= 0 || _pickedDate == null) {
      return;
    }

    widget.onTxAdded(title, amount, _pickedDate);
    //FocusScope.of(context).unfocus();
    Navigator.of(context).pop();
  }
}
