import 'package:daily_news/components/button.dart';
import 'package:flutter/material.dart';

import '../components/constant.dart';

class NewsDetails extends StatelessWidget {
  final newsDetailTitle,
      newsDetailSource,
      newsDetailImage,
      newsDetailDescription,
      newsAuthor,
      newsPublishTime;
  const NewsDetails(
      {super.key,
      required this.newsDetailTitle,
      required this.newsDetailImage,
      required this.newsDetailSource,
      required this.newsDetailDescription,
      required this.newsAuthor,
      required this.newsPublishTime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          newsDetailSource,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[400],
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
          size: 30,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Image.network(
                  newsDetailImage,
                  fit: BoxFit.cover,
                  height: 220,
                  width: double.infinity,
                ),
              ),
              const SizedBox(
                height: defautPadding * 0.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    newsAuthor,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    newsPublishTime,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: defautPadding * 1.5,
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    style: BorderStyle.solid,
                    width: 1,
                  ),
                  color: Colors.grey[400],
                ),
                child: Text(
                  newsDetailSource,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.green[800],
                  ),
                ),
              ),
              const SizedBox(
                height: defautPadding,
              ),
              Text(
                newsDetailTitle,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 21,
                ),
              ),
              const SizedBox(
                height: defautPadding * 0.5,
              ),
              Text(
                newsDetailDescription,
                style: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(
                height: defautPadding * 2,
              ),
              const MyButton(
                buttonName: 'Read More',
                iconName: Icons.arrow_forward_ios,
              )
            ],
          ),
        ),
      ),
    );
  }
}
