import 'package:daily_news/views/business_page.dart';
import 'package:daily_news/views/entertainment_page.dart';
import 'package:daily_news/views/healthcare_page.dart';
import 'package:daily_news/views/science_page.dart';
import 'package:daily_news/views/sport_page.dart';
import 'package:daily_news/views/technology_page.dart';

class Category {
  final String image, categoryName;
  dynamic routes;
  Category({
    required this.image,
    required this.categoryName,
    required this.routes,
  });
}

List categoryCard = [
  Category(
    image: 'assets/images/Business.jpg',
    categoryName: 'Business',
    routes: const BusinessPage(),
  ),
  Category(
    image: 'assets/images/Entertainment.jpg',
    categoryName: 'Entertainment',
    routes: const EntertainmentPage(),
  ),
  Category(
    image: 'assets/images/Healthcare.jpg',
    categoryName: 'Healthcare',
    routes: const HealthCarePage(),
  ),
  Category(
    image: 'assets/images/News.jpg',
    categoryName: 'Technology',
    routes: const TechnologyPage(),
  ),
  Category(
    image: 'assets/images/Science.jpg',
    categoryName: 'Science',
    routes: const SciencePage(),
  ),
  Category(
    image: 'assets/images/Sport.jpg',
    categoryName: 'Sport',
    routes: const SportPage(),
  ),
];
