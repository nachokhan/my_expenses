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
      amount: 45,
      date: DateTime.now().subtract(Duration(days: 1)),
      id: "1",
      title: "Shoes",
    ),
		Transaction(
      amount: 110,
      date: DateTime.now().subtract(Duration(days: 2)),
      id: "2",
      title: "Bike Components",
    ),
		Transaction(
      amount: 2500,
      date: DateTime.now().subtract(Duration(days: 2)),
      id: "3",
      title: "New Bike Spec",
    ),
		Transaction(
      amount: 8,
      date: DateTime.now().subtract(Duration(days: 3)),
      id: "4",
      title: "School Utils",
    ),
		Transaction(
      amount: 70,
      date: DateTime.now().subtract(Duration(days: 3)),
      id: "5",
      title: "Sport TShirt",
    ),
		Transaction(
      amount: 15,
      date: DateTime.now().subtract(Duration(days: 3)),
      id: "6",
      title: "Food & Drinks",
    ),
		Transaction(
      amount: 36,
      date: DateTime.now().subtract(Duration(days: 4)),
      id: "7",
      title: "Mate Kit",
    ),
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
            WTransactionList(transactions, () {
              setState(() {});
            }),
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

  addNewTransaction(String title, double amount, DateTime date) {
    setState(() {
      transactions.add(Transaction(
        amount: amount,
        title: title,
        date: date,
        id: DateTime.now().toString(),
      ));
    });
  }
}
