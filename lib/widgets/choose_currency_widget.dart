import 'package:exchange_rate/choose_currency/choose_currency_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseCurrencyWidget extends StatefulWidget {
  const ChooseCurrencyWidget({Key? key}) : super(key: key);

  @override
  _ChooseCurrencyWidgetState createState() => _ChooseCurrencyWidgetState();
}

class _ChooseCurrencyWidgetState extends State<ChooseCurrencyWidget> {
  var selectedCurrencies = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Выберите валютные пары"),
        actions: [
          IconButton(
              onPressed: () => {}, icon: const Icon(Icons.save_outlined)),
        ],
      ),
      body: BlocBuilder<ChooseCurrencyBloc, ChooseCurrencyState>(
        builder: (context, state) {
          if (state is LoadingChooseCurrencyState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is FailedLoadingChooseCurrencyState) {
            return const Center(
              child: Text('Download failed'),
            );
          }
          if (state is ChooseCurrencySuccessState) {
            return list(state.offices);
          }
          return const Center(
            child: Text('Error'),
          );
        },
      ),
    );
  }

  Widget list(List<String>? list) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: list!.length,
      separatorBuilder: (context, index) => const Divider(thickness: 2),
      itemBuilder: (BuildContext context, int index) {
        return CheckboxListTile(
          title: Text(list[index]),
          value: false,
          onChanged: (value) {
            setState(() {
              value = value;
              //selectedCurrencies.add(list[index]);
            });
          },
        );
      },
    );
  }
}
