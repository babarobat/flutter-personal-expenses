
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pe_flutter/models/transaction.dart';


class CircleListItem extends StatelessWidget {
  final Function (Transaction) deleteCallback;
  final Transaction transaction;

  const CircleListItem({Key? key, required this.deleteCallback, required this.transaction}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                transaction.price.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
            ),
          ),
        ),
        title: Text(
          transaction.name,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.delete,
            color: Theme.of(context).errorColor,
          ),
          onPressed: _onDeletePressed,
        ),
      ),
    );
  }

  void _onDeletePressed() {
    deleteCallback(transaction);
  }
}
