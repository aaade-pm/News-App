import 'package:daily_news/views/business_page.dart';
import 'package:daily_news/views/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/secondRoute',
      routes: {
        '/': (context) => const HomePage(),
        '/secondRoute': (context) => const BusinessPage(),
      },

      //home: const MyHomePage(),
    );
  }
}
