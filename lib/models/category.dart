import 'package:daily_news/views/business_page.dart';

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
    routes: null,
  ),
  Category(
    image: 'assets/images/Healthcare.jpg',
    categoryName: 'Healthcare',
    routes: null,
  ),
  Category(
    image: 'assets/images/News.jpg',
    categoryName: 'News',
    routes: null,
  ),
  Category(
    image: 'assets/images/Science.jpg',
    categoryName: 'Science',
    routes: null,
  ),
  Category(
    image: 'assets/images/Sport.jpg',
    categoryName: 'Sport',
    routes: null,
  ),
];
