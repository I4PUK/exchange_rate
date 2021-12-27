part of 'choose_currency_bloc.dart';

abstract class CurrencyRatesEvent {
  const CurrencyRatesEvent();
}

class InitialChooseCurrencyEvent extends CurrencyRatesEvent {
  const InitialChooseCurrencyEvent();
}
