import 'package:exchange_rate/models/currencies_map/currencies_map.dart';
import 'package:exchange_rate/services/currencies_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'currency_rates_event.dart';
part 'currency_rates_state.dart';

class CurrencyRatesBloc extends Bloc<CurrencyRatesEvent, CurrencyRatesState> {
  CurrenciesMap pairs = CurrenciesMap();
  CurrencyRatesBloc(CurrencyRatesState initialState) : super(initialState);

  @override
  Stream<CurrencyRatesState> mapEventToState(CurrencyRatesEvent event) async* {
    if (event is InitialCurrencyRatesEvent) {
      pairs = await _getCurrencyList();
      Map<String, dynamic>? pairsList = pairs.currencies ?? {};

      if (pairsList.isNotEmpty) {
        yield ChooseCurrencyRatesState(pairs.currencies);
      } else {
        yield const FailedLoadingCurrencyRatesState();
      }

      return;
    }
  }

  Future<CurrenciesMap> _getCurrencyList() async {
    final getRequest = await CurrencyService.getRates();
    return getRequest;
  }
}
