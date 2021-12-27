part of 'currency_rates_bloc.dart';

abstract class CurrencyRatesEvent {
  const CurrencyRatesEvent();
}

class InitialCurrencyRatesEvent extends CurrencyRatesEvent {
  const InitialCurrencyRatesEvent();
}
