import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/core/state/app_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StockPricePage extends ConsumerStatefulWidget {
  const StockPricePage({super.key});

  @override
  _StockPriceScreenState createState() => _StockPriceScreenState();
}

class _StockPriceScreenState extends ConsumerState<StockPricePage> {
  final _controller = TextEditingController();
  String _stockSymbol = 'AAPL';

  @override
  Widget build(BuildContext context) {
    final stockPriceAsync = ref.watch(stockPriceProvider(_stockSymbol));

    return Scaffold(
      appBar: AppBar(title: Text('Stock Price Search')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter Stock Symbol',
                hintText: 'e.g AAPL',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      _stockSymbol = _controller.text;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 200),
            stockPriceAsync.when(
              data: (data) {
                final price =
                    data['Time Series (5min)']?.values?.first['4. close'] ??
                        'N/A';
                return Text(
                  'Current Price: \$ $price',
                  style: TextStyle(fontSize: 20),
                );
              },
              loading: () => CircularProgressIndicator(),
              error: (error, stack) => Text('Error: $error'),
            ),
          ],
        ),
      ),
    );
  }
}
