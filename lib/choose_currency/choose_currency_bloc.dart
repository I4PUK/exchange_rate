import 'package:exchange_rate/models/currencies_list/currencies_list.dart';
import 'package:exchange_rate/services/currencies_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'choose_currency_event.dart';
part 'choose_currency_state.dart';

class ChooseCurrencyBloc extends Bloc<CurrencyRatesEvent, ChooseCurrencyState> {
  CurrenciesList pairs = CurrenciesList();
  ChooseCurrencyBloc(ChooseCurrencyState initialState) : super(initialState);

  @override
  Stream<ChooseCurrencyState> mapEventToState(CurrencyRatesEvent event) async* {
    if (event is InitialChooseCurrencyEvent) {
      pairs = await _getCurrencyList();
      List<String>? pairsList = pairs.currencies ?? [];

      if (pairsList.isNotEmpty) {
        yield ChooseCurrencySuccessState(pairsList);
      } else {
        yield const FailedLoadingChooseCurrencyState();
      }

      return;
    }
  }

  Future<CurrenciesList> _getCurrencyList() async {
    final getRequest = await CurrencyService.getAllPairs();
    return getRequest;
  }
}
