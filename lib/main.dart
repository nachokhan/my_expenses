import 'package:flutter/material.dart';

import 'package:my_expenses/widgets/w_chart.dart';
import './models/transaction.dart';
import './widgets/w_transaction_input.dart';
import './widgets/w_transaction_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Expenses',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.lightBlue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [
    Transaction(
      amount: 5,
      date: DateTime.now().subtract(Duration(days: 1)),
      id: "1",
      title: "Pancito 1",
    ),
    Transaction(
      amount: 20,
      date: DateTime.now().subtract(Duration(days: 2)),
      id: "1",
      title: "Pancito 3",
    ),
 /*   Transaction(
      amount: 18,
      date: DateTime.now().subtract(Duration(days: 3)),
      id: "1",
      title: "Pancito 4",
    ),
    Transaction(
      amount: 12,
      date: DateTime.now().subtract(Duration(days: 3)),
      id: "1",
      title: "Pancito 5",
    ),
    Transaction(
      amount: 40.90,
      date: DateTime.now().subtract(Duration(days: 4)),
      id: "1",
      title: "Pancito 6",
    ),
    Transaction(
      amount: 66.66,
      date: DateTime.now().subtract(Duration(days: 6)),
      id: "1",
      title: "Pancito 7",
    ),
    Transaction(
      amount: 7777.7777,
      date: DateTime.now().subtract(Duration(days: 7)),
      id: "1",
      title: "Pancito 8",
    ),
    Transaction(
      amount: 999.90,
      date: DateTime.now().subtract(Duration(days: 8)),
      id: "1",
      title: "Pancito 9",
    ),*/

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Expenses"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => onPressAddTransaction(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Theme.of(context).accentColor,
                child: WChart(transactions),
                elevation: 5,
              ),
            ),
            WTransactionList(transactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => onPressAddTransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }

  onPressAddTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context, builder: (context) => getInputWidget(context));
  }

  getInputWidget(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onLongPress: () => print("Soltame jijiji"),
      onTap: () => {},
      child: WTransactionInput(addNewTransaction),
    );
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
