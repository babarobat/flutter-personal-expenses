import 'package:flutter/material.dart';
import 'package:pe_flutter/models/model.dart';
import 'package:pe_flutter/models/transaction.dart';
import 'package:pe_flutter/widgets/circle_list_item.dart';

import 'no_transactions.dart';

class TransactionsList extends StatelessWidget {
  final Model model;
  final Function(Transaction) deleteTransactionCallback;

  const TransactionsList(
      this.model, this.deleteTransactionCallback);

  @override
  Widget build(BuildContext context) {
    return model.transactions.isEmpty
        ? _buildEmpty(context)
        : _buildTransactions(context);
  }

  Widget _buildTransactions(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, i) {
        return CircleListItem(
          transaction: model.transactions[i],
          deleteCallback: deleteTransactionCallback,
        );
      },
      itemCount: model.transactions.length,
    );
  }

  Widget _buildEmpty(BuildContext context) {
    return NoTransactions();
  }
}
