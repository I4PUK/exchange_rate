import 'package:json_annotation/json_annotation.dart';
part 'currencies_list.g.dart';

@JsonSerializable()
class CurrenciesList {
  List<String>? currencies;

  CurrenciesList({this.currencies});

  factory CurrenciesList.fromJson(Map<String, dynamic> json) =>
      _$CurrenciesListFromJson(json);
}
