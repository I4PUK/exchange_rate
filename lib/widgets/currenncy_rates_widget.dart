import 'package:exchange_rate/choose_currency/choose_currency_bloc.dart';
import 'package:exchange_rate/currency_rates/currency_rates_bloc.dart';
import 'package:exchange_rate/widgets/choose_currency_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyRatesWidget extends StatelessWidget {
  const CurrencyRatesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Курсы валют"),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<CurrencyRatesBloc, CurrencyRatesState>(
              builder: (context, state) {
                if (state is LoadingCurrencyRatesState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is FailedLoadingChooseCurrencyState) {
                  return const Center(
                    child: Text('Download failed'),
                  );
                }
                if (state is ChooseCurrencyRatesState) {
                  return list(state.currencies);
                }
                return const Center(
                  child: Text('Error'),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) =>
                  ChooseCurrencyBloc(LoadingChooseCurrencyState())
                    ..add(const InitialChooseCurrencyEvent()),
              child: const ChooseCurrencyWidget(),
            ),
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget list(Map<String, dynamic>? pair) {
    var pairEntries = pair!.entries.toList();
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: pair.length,
      separatorBuilder: (context, index) => const Divider(thickness: 2),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(pairEntries[index].key),
          trailing: Text(pairEntries[index].value),
        );
      },
    );
  }
}
