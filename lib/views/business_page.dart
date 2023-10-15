import 'package:daily_news/components/news_tile.dart';
import 'package:daily_news/services/api_services.dart';
import 'package:daily_news/views/news_details.dart';
import 'package:flutter/material.dart';

import '../models/article_model.dart';

class BusinessPage extends StatefulWidget {
  const BusinessPage({super.key});

  @override
  State<BusinessPage> createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage> {
  ApiService apiServices = ApiService();
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
              'Business',
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
          future: apiServices.getArticle(),
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
