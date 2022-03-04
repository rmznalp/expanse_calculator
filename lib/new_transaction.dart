import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) return;
    widget.addTx(enteredTitle, enteredAmount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'Title',
            ),
            controller: titleController,
            onSubmitted: (_) => submitData(),
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Amount',
            ),
            keyboardType: TextInputType.number,
            controller: amountController,
            onSubmitted: (_) => submitData(),
          ),
          TextButton(
            onPressed: submitData,
            child: const Text('Add Transaction'),
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.purple)),
          )
        ]),
      ),
    );
  }
}
