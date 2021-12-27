import 'dart:convert';

import 'package:exchange_rate/models/currencies_list/currencies_list.dart';
import 'package:exchange_rate/models/currencies_map/currencies_map.dart';
import 'package:http/http.dart' as http;

class CurrencyService {
  static const _apiKey = '0aae97ba9744617fdc542cc302ee8159';
  static const _allPairsUrl =
      'https://currate.ru/api/?get=currency_list&key=$_apiKey';
  static const _choosenRatesApi =
      'https://currate.ru/api/?get=rates&pairs=USDRUB,EURRUB&key=$_apiKey';

  static Future<CurrenciesMap> getRates() async {
    final url = Uri.parse(_choosenRatesApi);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return CurrenciesMap.fromJson(json.decode(response.body));
    } else {
      return CurrenciesMap();
    }
  }

  static Future<CurrenciesList> getAllPairs() async {
    Uri url = Uri.parse(_allPairsUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return CurrenciesList.fromJson(json.decode(response.body));
    } else {
      return CurrenciesList();
    }
  }
}
