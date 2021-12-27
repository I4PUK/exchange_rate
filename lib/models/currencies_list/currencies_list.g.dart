// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currencies_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrenciesList _$CurrenciesListFromJson(Map<String, dynamic> json) =>
    CurrenciesList(
      currencies:
          (json['data'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CurrenciesListToJson(CurrenciesList instance) =>
    <String, dynamic>{
      'currencies': instance.currencies,
    };
