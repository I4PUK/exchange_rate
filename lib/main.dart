import 'package:exchange_rate/currency_rates/currency_rates_bloc.dart';
import 'package:exchange_rate/widgets/currenncy_rates_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => CurrencyRatesBloc(LoadingCurrencyRatesState())
          ..add(const InitialCurrencyRatesEvent()),
        child: const CurrencyRatesWidget(),
      ),
    );
  }
}
