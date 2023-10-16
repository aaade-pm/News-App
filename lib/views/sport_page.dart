import 'package:daily_news/components/news_tile.dart';
import 'package:daily_news/services/api_services.dart';
import 'package:daily_news/views/news_details.dart';
import 'package:flutter/material.dart';

import '../models/article_model.dart';

class SportPage extends StatefulWidget {
  const SportPage({super.key});

  @override
  State<SportPage> createState() => _SportPageState();
}

class _SportPageState extends State<SportPage> {
  ApiService apiServices = ApiService();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      body: FutureBuilder(
          future: apiServices.getSportArticle(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
            if (snapshot.hasData) {
              List<Article>? articles = snapshot.data;
              return ListView.builder(
                itemCount: articles?.length,
                itemBuilder: (context, index) {
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
                                  newsDetailSource:
                                      articles?[index].source.name,
                                  newsDetailTitle: articles?[index].title,
                                  newsDetailImage: articles?[index].urlToImage,
                                  newsDetailDescription:
                                      articles?[index].description,
                                  newsAuthor: articles?[index].author,
                                  newsPublishTime: articles?[index].publishedAt,
                                )));
                      },
                      child: NewsTile(
                        newsImage: articles?[index].urlToImage,
                        newsSource: articles?[index].source.name,
                        newsTitle: articles?[index].title,
                      ),
                    ),
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
