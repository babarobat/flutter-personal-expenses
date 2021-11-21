import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pe_flutter/models/transaction.dart';

class SquareListItem extends StatelessWidget {
  final Transaction transaction;

   SquareListItem({Key? key, required this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildCard(transaction, context);
  }

  Card _buildCard(Transaction e, BuildContext context) {
    return Card(
      elevation: 5,
      child: Row(
        children: [
          _price(e, context),
          _description(e, context),
        ],
      ),
    );
  }

  Column _description(Transaction e, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title(e, context),
        _date(e, context),
      ],
    );
  }

  Text _date(Transaction e, BuildContext context) {
    return Text(
      DateFormat().add_yMMMd().format(e.date),
      style: const TextStyle(fontSize: 14, color: Colors.grey),
    );
  }

  Text _title(Transaction e, BuildContext context) {
    return Text(
      e.name,
      style: Theme.of(context).textTheme.subtitle1,
    );
  }

  Container _price(Transaction e, BuildContext context) {
    return Container(
      width: 110,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 2,
        ),
      ),
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Text(
        '${e.price}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
          fontSize: 20,
        ),
      ),
    );
  }
}
