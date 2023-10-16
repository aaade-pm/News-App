import 'package:daily_news/views/business_page.dart';
import 'package:daily_news/views/entertainment_page.dart';
import 'package:daily_news/views/healthcare_page.dart';
import 'package:daily_news/views/homepage.dart';
import 'package:daily_news/views/science_page.dart';
import 'package:daily_news/views/sport_page.dart';
import 'package:daily_news/views/technology_page.dart';
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
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/secondRoute': (context) => const BusinessPage(),
        '/thirdRoute': (context) => const EntertainmentPage(),
        '/fourthRoute': (context) => const HealthCarePage(),
        '/fifthRoute': (context) => const TechnologyPage(),
        '/sixthRoute': (context) => const SciencePage(),
        '/seventhRoute': (context) => const SportPage(),
      },

      //home: const MyHomePage(),
    );
  }
}
