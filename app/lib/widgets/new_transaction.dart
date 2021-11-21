import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function(String, String, DateTime) _callBack;

  NewTransaction(this._callBack, {Key? key}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController _price = TextEditingController();
  final TextEditingController _title = TextEditingController();
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _titleInput(),
            _priceInput(),
            _datePicker(),
            _addButton(),
          ],
        ),
      ),
    );
  }

  TextField _titleInput() {
    return TextField(
      controller: _title,
      decoration: const InputDecoration(
        labelText: 'title',
      ),
    );
  }

  TextField _priceInput() {
    return TextField(
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      controller: _price,
      decoration: const InputDecoration(
        labelText: 'price',
      ),
    );
  }

  Widget _addButton() {
    return RaisedButton(
      color: Theme.of(context).colorScheme.primary,
      onPressed: () => _submitData(),
      child: const Text('Add'),
    );
  }

  Widget _datePicker() {
    return Container(
      height: 60,
      child: Row(
        children: [
          Expanded(child: _date()),
          TextButton(
            onPressed: _presentDatePicker,
            child: const Text(
              'choose date',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _submitData() {
    final title = _title.text;
    final price = _price.text;

    if (title.isEmpty || price.isEmpty) {
      return;
    }

    final p = double.tryParse(price);
    if (p == null) {
      return;
    }
    if (_selectedDate == null) {
      return;
    }

    if (_selectedDate == null) {
      return;
    }

    widget._callBack(_title.text, _price.text, _selectedDate as DateTime);

    Navigator.of(context).pop();
  }

  Widget _date() {
    return _selectedDate == null
        ? Text('select date!')
        : Text(
            'picked date: ${DateFormat.yMd().format(_selectedDate as DateTime)}');
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((value) => _selectDate(value));
  }

  _selectDate(DateTime? value) {
    if (value == null) {
      return;
    }
    _selectedDate = value;
    setState(() {});
  }
}
