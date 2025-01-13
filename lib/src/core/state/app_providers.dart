import 'package:flutter_application_1/src/features/Stock%20Price%20Screen/data/stock_dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

// Provider for StockApiClient
final stockApiClientProvider = Provider<StockApiClient>((ref) {
  return StockApiClient(httpClient: http.Client());
});

// Provider for fetching stock prices asynchronously
final stockPriceProvider =
    FutureProvider.family<Map<String, dynamic>, String>((ref, symbol) async {
  final apiClient = ref.watch(stockApiClientProvider);
  final stockData = await apiClient.fetchStockPrice(symbol);
  return stockData;
});
