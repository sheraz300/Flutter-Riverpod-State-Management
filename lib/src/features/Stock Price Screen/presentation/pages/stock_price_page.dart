import 'package:flutter/material.dart';
import 'package:flutter_application_1/lib.dart';
import 'package:flutter_application_1/src/core/constants/app_strings.dart';
import 'package:flutter_application_1/src/core/state/local_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StockPricePage extends ConsumerWidget {
  StockPricePage({super.key});
  final stockController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stockSymbol = ref.watch(stockSymbolProvider);
    final stockPriceAsync = ref.watch(stockPriceProvider(stockSymbol));

    return Scaffold(
      appBar: AppBar(title: Text('${AppStrings.stockPriceof} $stockSymbol')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: stockController,
              decoration: InputDecoration(
                labelText: AppStrings.enterStockSymbol,
                suffixIcon: IconButton(
                    onPressed: () {
                      ref.read(stockSymbolProvider.notifier).state =
                          stockController.text;
                    },
                    icon: Icon(Icons.search)),
              ),
            ),
            SizedBox(height: 200),
            stockPriceAsync.when(
              data: (data) {
                final price =
                    data[AppStrings.timeSeries]?.values?.first['4. close'] ??
                        'N/A';
                return Text('${AppStrings.currentPrice} \$ $price');
              },
              loading: () => CircularProgressIndicator(),
              error: (error, stack) => Text('${AppStrings.error} $error'),
            ),
          ],
        ),
      ),
    );
  }
}
