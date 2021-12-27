part of 'currency_rates_bloc.dart';

abstract class CurrencyRatesState {
  const CurrencyRatesState();
}

class LoadingCurrencyRatesState extends CurrencyRatesState {}

class ChooseCurrencyRatesState extends CurrencyRatesState {
  Map<String, dynamic>? currencies;

  ChooseCurrencyRatesState(this.currencies);
}

class FailedLoadingCurrencyRatesState extends CurrencyRatesState {
  const FailedLoadingCurrencyRatesState();
}
