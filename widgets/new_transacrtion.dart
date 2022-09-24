import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function handler;

  NewTransaction(this.handler);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  late DateTime _selectedDate = DateTime.now();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (amountController.text.isEmpty) {
      return;
    }
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.handler(enteredTitle, enteredAmount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((PickedDate) {
      if (PickedDate == null) return;
      setState(() {
        _selectedDate = PickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 10,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
            right: 10,
            left: 10,
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  controller: titleController,
                  onSubmitted: (_) => submitData(),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => submitData(),
                ),
                Container(
                  height: 70,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          _selectedDate == null
                              ? 'No Date Choosen'
                              : 'Date: ${DateFormat.yMd().format(_selectedDate)}',
                        ),
                      ),
                      FlatButton(
                        onPressed: _presentDatePicker,
                        textColor: Theme.of(context).primaryColor,
                        child: Text(
                          'CHOOSE DATE',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                RaisedButton(
                    color: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).textTheme.button!.color,
                    onPressed: submitData,
                    child: Text(
                      'Add Transaction',
                    )),
              ]),
        ),
      ),
    );
  }
}
