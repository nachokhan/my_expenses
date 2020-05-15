import 'package:flutter/material.dart';
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
        amount: 43.90, date: DateTime.now(), id: "1", title: "Pancito Casero"),
    Transaction(amount: 45, date: DateTime.now(), id: "2", title: "Lechugon")
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
                child: Text("CHART"),
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
