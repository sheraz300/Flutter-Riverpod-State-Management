import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class StockApiClient {
  final http.Client httpClient;

  StockApiClient({required this.httpClient});

  Future<Map<String, dynamic>> fetchStockPrice(String symbol) async {
    final apiKey = dotenv.env['API_KEY'];
    if (apiKey == null) {
      throw Exception('API key is not set in .env');
    }

    final response = await httpClient.get(
      Uri.parse(
          'https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=$symbol&interval=5min&apikey=$apiKey'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Failed to load stock price');
    }
  }
}
