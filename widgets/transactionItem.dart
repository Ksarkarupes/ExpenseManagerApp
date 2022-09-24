import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import 'Chart.dart';

class transactionItem extends StatelessWidget {
  const transactionItem({
    Key? key,
    required this.transactions,
    required this.deletetx,
  }) : super(key: key);

  final Transaction transactions;
  final Function deletetx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                '\u{20B9}${transactions.amount}',
              ),
            ),
          ),
        ),
        title: Text(
          transactions.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transactions.date),
        ),
        trailing: MediaQuery.of(context).size.width > 400
            ? FlatButton.icon(
                onPressed: () => deletetx(transactions.id),
                icon: Icon(Icons.delete),
                label: const Text('Delete'),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => deletetx(transactions.id),
              ),
      ),
    );
  }
}
