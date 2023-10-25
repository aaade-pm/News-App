import 'package:daily_news/components/constant.dart';
import 'package:daily_news/components/news_tile.dart';
import 'package:daily_news/models/category.dart';
import 'package:daily_news/views/news_details.dart';

import 'package:flutter/material.dart';

import '../models/article_model.dart';
import '../services/api_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService apiServices = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Row(
          children: [
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Daily',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 23,
                  ),
                ),
                Text(
                  'News',
                  style: TextStyle(
                    color: Colors.green[800],
                    fontSize: 23,
                  ),
                ),
              ],
            )),
          ],
        ),
        actions: [
          Icon(
            Icons.notifications_none_outlined,
            color: Colors.black54,
            size: 25,
          ),
          SizedBox(
            width: defautPadding,
          ),
          Icon(
            Icons.search_outlined,
            color: Colors.black54,
            size: 25,
          ),
          SizedBox(
            width: defautPadding,
          ),
        ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black54,
        elevation: 0,
      ),
      drawer: const Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'Home',
            activeIcon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.wifi_tethering_outlined,
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark_added_outlined,
            ),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outlined,
            ),
            label: 'Profile',
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: SizedBox(
                height: 110,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryCard.length,
                  itemBuilder: (context, index) {
                    return categorySection(categoryCard[index], context);
                  },
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 15,
                top: 20,
                bottom: 20,
              ),
              child: Text(
                'TRENDING NOW',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.58,
              child: FutureBuilder(
                  future: apiServices.getTrendingArticle(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Article>> snapshot) {
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
                                          newsDetailTitle:
                                              articles?[index].title,
                                          newsDetailImage:
                                              articles?[index].urlToImage,
                                          newsDetailDescription:
                                              articles?[index].description,
                                          newsAuthor: articles?[index].author,
                                          newsPublishTime:
                                              articles?[index].publishedAt,
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
            ),
            SizedBox(
              height: defautPadding * 3,
            )
          ],
        )),
      ),
    );
  }
}

categorySection(Category category, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => category.routes));
    },
    child: Container(
      padding: const EdgeInsets.only(
        left: 10,
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                category.image,
                height: 100,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 20,
                spreadRadius: 20,
                offset: const Offset(5, 0),
              )
            ]),
            child: Text(
              category.categoryName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
