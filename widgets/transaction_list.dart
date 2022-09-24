// ignore_for_file: unused_field, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../models/transaction.dart';

import './transactionItem.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deletetx;
  TransactionList(this.transaction, this.deletetx);
  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text('No transaction added yet',
                    style: Theme.of(context).textTheme.headline6),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'C:/Users/koust/OneDrive/Documents/Development/Project/expense_manager/assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return transactionItem(
                  transactions: transaction[index], deletetx: deletetx);
            },
            itemCount: transaction.length,
          );
  }
}
