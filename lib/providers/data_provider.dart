import 'package:daily_news/models/article_model.dart';
import 'package:daily_news/services/api_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final businessArticleProvider = FutureProvider<List<Article>>((ref) async {
  return ref.watch(articleProvider).getBusinessArticle();
});
final entertainmentArticleProvider = FutureProvider<List<Article>>((ref) async {
  return ref.watch(articleProvider).getEntertainmentArticle();
});
final healthcareArticleProvider = FutureProvider<List<Article>>((ref) async {
  return ref.watch(articleProvider).getHealthArticle();
});
final scienceArticleProvider = FutureProvider<List<Article>>((ref) async {
  return ref.watch(articleProvider).getScienceArticle();
});
final sportArticleProvider = FutureProvider<List<Article>>((ref) async {
  return ref.watch(articleProvider).getSportArticle();
});
final technologyArticleProvider = FutureProvider<List<Article>>((ref) async {
  return ref.watch(articleProvider).getTechnologyArticle();
});
final trendingArticleProvider = FutureProvider<List<Article>>((ref) async {
  return ref.watch(articleProvider).getTrendingArticle();
});
