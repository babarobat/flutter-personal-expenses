import 'package:flutter/material.dart';
import 'package:pe_flutter/models/transaction.dart';
import 'package:pe_flutter/widgets/new_transaction.dart';

import 'chart.dart';
import 'package:pe_flutter/models/model.dart';
import 'transactions_list.dart';

class Home extends StatefulWidget {
  final Model model;

  const Home({Key? key, required this.model}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Transaction> get _transactions => widget.model.transactions;

  void _addTransaction(String title, String price, DateTime date) {
    var parsedPrice = double.parse(price);
    final newTransaction = Transaction(
        id: date.hashCode, name: title, price: parsedPrice, date: date);
    _transactions.add(newTransaction);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final appBar = _buildAppBar(context);
    return Scaffold(
      appBar: appBar,
      body: _body(context, appBar),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _addFloatingActionButton(context),
    );
  }

  FloatingActionButton _addFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        _onAddPressed(context);
      },
      child: Icon(
        Icons.add,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  Widget _body(BuildContext context, AppBar appBar) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Container(
              height: _calculateHeight(context, appBar, 0.3),
              child: Chart(widget.model)),
          Container(
              height: _calculateHeight(context, appBar, 0.7),
              child: TransactionsList(widget.model, _deleteTransaction)),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: const Text('personal expenses'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            _onAddPressed(context);
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  void _onAddPressed(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builderContext) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: NewTransaction((t, p, d) {
              _addTransaction(t, p, d);
            }),
          );
        });
  }

  _deleteTransaction(Transaction transaction) {
    setState(() {
      widget.model.transactions.remove(transaction);
    });
  }

  double _calculateHeight(BuildContext context, AppBar appBar, fraction) {
    var screenHeight = MediaQuery.of(context).size.height;
    var appBarHeight = appBar.preferredSize.height;
    var statusBarHeight = MediaQuery.of(context).padding.top;
    return (screenHeight - appBarHeight - statusBarHeight) * fraction;
  }
}
