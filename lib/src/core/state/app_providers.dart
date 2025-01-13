import 'package:flutter_application_1/lib.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider for API client
final stockApiClientProvider = Provider<StockApiClient>((ref) {
  return StockApiClient(httpClient: http.Client());
});

// The stock price provider (global state)
final stockPriceProvider =
    FutureProvider.family<Map<String, dynamic>, String>((ref, symbol) async {
  final apiClient = ref.watch(stockApiClientProvider);
  final stockData = await apiClient.fetchStockPrice(symbol);
  return stockData;
});
