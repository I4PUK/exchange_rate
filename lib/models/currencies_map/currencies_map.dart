class CurrenciesMap {
  Map<String, dynamic>? currencies;

  CurrenciesMap({this.currencies});

  factory CurrenciesMap.fromJson(Map<String, dynamic> json) =>
      CurrenciesMap(currencies: json['data']);
}
