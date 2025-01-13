import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/core/constants/app_strings.dart';
import 'package:flutter_application_1/src/features/Stock%20Price%20Screen/presentation/pages/stock_price_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      home: StockPricePage(),
    );
  }
}
