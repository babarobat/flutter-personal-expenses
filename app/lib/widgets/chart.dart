
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pe_flutter/models/chart_entry.dart';
import 'package:pe_flutter/models/model.dart';

import 'chart_bar.dart';


class Chart extends StatelessWidget {
  final Model model;

  List<ChartEntry> get _getEntries {
    var result = <ChartEntry>[];
    for (var i = 6; i >= 0; i--) {
      final dayDateTime = DateTime.now().subtract(Duration(days: i));
      final dayTransactions = model.transactions
          .where((element) => element.date.day == dayDateTime.day);

      var sum = 0.0;

      for (var transaction in dayTransactions) {
        sum += transaction.price;
      }
      result.add(ChartEntry(day: dayDateTime, amount: sum));
    }
    return result;
  }

  const Chart(this.model);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _buildCharts(),
        ),
      ),
    );
  }

  List<Widget> _buildCharts() {
    return _getEntries
        .map((e) => Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: ChartBar(
                label: DateFormat.E().format(e.day),
                spendingAmount: e.amount,
                spendingPercentageTotal: _totalSpendingPercent(e),
              ),
            ))
        .toList();
  }

  double _totalSpendingPercent(ChartEntry entry) {
    var total = model.totalSpend(7);
    if (total == 0) {
      return 0;
    }
    return entry.amount / total;
  }
}
