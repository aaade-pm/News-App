import 'package:daily_news/views/business_page.dart';
import 'package:daily_news/views/entertainment_page.dart';
import 'package:daily_news/views/firstpage.dart';
import 'package:daily_news/views/healthcare_page.dart';
import 'package:daily_news/views/homepage.dart';
import 'package:daily_news/views/science_page.dart';
import 'package:daily_news/views/sport_page.dart';
import 'package:daily_news/views/technology_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/firstRoute',
      routes: {
        '/': (context) => const HomePage(),
        '/secondRoute': (context) => const BusinessPage(),
        '/thirdRoute': (context) => const EntertainmentPage(),
        '/fourthRoute': (context) => const HealthCarePage(),
        '/fifthRoute': (context) => const TechnologyPage(),
        '/sixthRoute': (context) => const SciencePage(),
        '/seventhRoute': (context) => const SportPage(),
        '/firstRoute': (context) => const FirstPage(),
      },

      //home: const MyHomePage(),
    );
  }
}
