import 'package:expanse_planner/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Expense Calculator'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(id: 't1', title: 'New Shoes', amount: 40, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Weekly Groceries', amount: 100, date: DateTime.now())
  ];
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Card(
          color: Colors.blue,
          child: Container(width: double.infinity, child: const Text('Chart')),
          elevation: 5,
        ),
        Card(
          child: Container(
            padding: const EdgeInsets.all(10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
                controller: titleController,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Amount',
                ),
                controller: amountController,
              ),
              TextButton(
                onPressed: () => {},
                child: const Text('Add Transaction'),
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.purple)),
              )
            ]),
          ),
        ),
        Column(
          children: transactions.map(
            (e) {
              return Card(
                  child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: Text(
                      '\$ ${e.amount}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 2)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        e.title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w800),
                      ),
                      Text(
                        DateFormat.yMMMMd().format(e.date),
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      )
                    ],
                  )
                ],
              ));
            },
          ).toList(),
        )
      ]),
    );
  }
}
