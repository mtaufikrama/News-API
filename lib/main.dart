import 'package:flutter/material.dart';
import 'package:newsapi/homepage.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'WIKENYUS';
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      title: title,
      debugShowCheckedModeBanner: false,
      home: const HomePage(title: title),
    );
  }
}
