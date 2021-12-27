part of 'choose_currency_bloc.dart';

abstract class ChooseCurrencyState {
  const ChooseCurrencyState();
}

class LoadingChooseCurrencyState extends ChooseCurrencyState {}

class ChooseCurrencySuccessState extends ChooseCurrencyState {
  List<String>? offices;

  ChooseCurrencySuccessState(this.offices);
}

class FailedLoadingChooseCurrencyState extends ChooseCurrencyState {
  const FailedLoadingChooseCurrencyState();
}
