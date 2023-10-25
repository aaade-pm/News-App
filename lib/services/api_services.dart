import 'dart:convert';

import 'package:daily_news/models/article_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiService {
  final endPointUrl =
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=aaa07db5780d449886a774850cd5bba2";

  final endPointUrl1 =
      "https://newsapi.org/v2/top-headlines?country=us&category=entertainment&apiKey=aaa07db5780d449886a774850cd5bba2";

  final endPointUrl2 =
      "https://newsapi.org/v2/top-headlines?country=us&category=health&apiKey=aaa07db5780d449886a774850cd5bba2";

  final endPointUrl3 =
      "https://newsapi.org/v2/top-headlines?country=us&category=science&apiKey=aaa07db5780d449886a774850cd5bba2";

  final endPointUrl4 =
      "https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=aaa07db5780d449886a774850cd5bba2";

  final endPointUrl5 =
      "https://newsapi.org/v2/top-headlines?country=us&category=technology&apiKey=aaa07db5780d449886a774850cd5bba2";

  final endPointUrl6 =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=aaa07db5780d449886a774850cd5bba2";

  //make http request
  Future<List<Article>> getBusinessArticle() async {
    var res = await http.get(Uri.parse(endPointUrl));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw Exception("Can't get article");
    }
  }

  Future<List<Article>> getEntertainmentArticle() async {
    var res = await http.get(Uri.parse(endPointUrl1));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw ("Can't get article");
    }
  }

  Future<List<Article>> getHealthArticle() async {
    var res = await http.get(Uri.parse(endPointUrl2));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw ("Can't get article");
    }
  }

  Future<List<Article>> getScienceArticle() async {
    var res = await http.get(Uri.parse(endPointUrl3));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw ("Can't get article");
    }
  }

  Future<List<Article>> getSportArticle() async {
    var res = await http.get(Uri.parse(endPointUrl4));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw ("Can't get article");
    }
  }

  Future<List<Article>> getTechnologyArticle() async {
    var res = await http.get(Uri.parse(endPointUrl5));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw ("Can't get article");
    }
  }

  Future<List<Article>> getTrendingArticle() async {
    Response res = await http.get(Uri.parse(endPointUrl6));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw Exception(res.reasonPhrase);
    }
  }
}

final articleProvider = Provider<ApiService>((ref) {
  return ApiService();
});
