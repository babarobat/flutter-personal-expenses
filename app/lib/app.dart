import 'package:flutter/material.dart';
import 'package:pe_flutter/models/model.dart';

import 'widgets/home.dart';

class App extends StatelessWidget {
  final Model model;

  const App(this.model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'wishery',
      theme: _theme(),
      home: Home(
        model: model,
      ),
    );
  }

  ThemeData _theme() {
    return ThemeData(
      fontFamily: 'Quicksand',
      textTheme: _textTheme(),
      appBarTheme: _appBarTheme(),
      colorScheme: _colorScheme(),
      buttonTheme:  _buttonTheme(),
    );
  }

  ColorScheme _colorScheme() {
    return ColorScheme.fromSwatch(
      primarySwatch: Colors.purple,
    ).copyWith(
      secondary: Colors.amber,
    );
  }

  AppBarTheme _appBarTheme() {
    return AppBarTheme(
        textTheme: ThemeData.light().textTheme.copyWith(
                headline6: const TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            )));
  }

  TextTheme _textTheme() {
    return ThemeData.light().textTheme.copyWith(
          headline1: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        );
  }

  ButtonThemeData _buttonTheme() {
    return ButtonThemeData(
      textTheme: ButtonTextTheme.primary);
  }
}
