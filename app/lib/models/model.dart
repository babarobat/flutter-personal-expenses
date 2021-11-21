

import 'transaction.dart';

class Model {
  final List<Transaction> transactions = [];

  Iterable<Transaction> recent(int days) {
    return transactions.where((element) =>
        element.date.isAfter(DateTime.now().subtract(Duration(days: days))));
  }

  double totalSpend(int days) {
    return recent(days)
        .fold(0, (previousValue, element) => previousValue + element.price);
  }
}
