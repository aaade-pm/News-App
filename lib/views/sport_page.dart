import 'package:daily_news/components/news_tile.dart';
import 'package:daily_news/providers/data_provider.dart';
import 'package:daily_news/views/news_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/article_model.dart';

class SportPage extends ConsumerWidget {
  const SportPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final sportNewsData = ref.watch(sportArticleProvider);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
          size: 30,
        ),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sport',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 25,
              ),
            ),
            Text(
              'News',
              style: TextStyle(
                color: Colors.green[800],
                fontSize: 25,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.grey[400],
        elevation: 0,
      ),
      body: sportNewsData.when(
        data: (sportNewsData) {
          List<Article> newsList = sportNewsData.map((e) => e).toList();
          return ListView.builder(
            itemCount: newsList.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  left: 15,
                  right: 15,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NewsDetails(
                              newsDetailSource: newsList[index].source.name,
                              newsDetailTitle: newsList[index].title,
                              newsDetailImage: newsList[index].urlToImage,
                              newsDetailDescription:
                                  newsList[index].description,
                              newsAuthor: newsList[index].author,
                              newsPublishTime: newsList[index].publishedAt,
                            )));
                  },
                  child: NewsTile(
                    newsImage: newsList[index].urlToImage,
                    newsSource: newsList[index].source.name,
                    newsTitle: newsList[index].title,
                  ),
                ),
              );
            },
          );
        },
        error: (err, s) => Text(err.toString()),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
