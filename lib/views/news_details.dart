import 'package:daily_news/components/button.dart';
import 'package:flutter/material.dart';

import '../components/constant.dart';

// ignore: must_be_immutable
class NewsDetails extends StatelessWidget {
  dynamic newsDetailTitle,
      newsDetailSource,
      newsDetailImage,
      newsDetailDescription,
      newsAuthor,
      newsPublishTime;
  NewsDetails(
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
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      // If the image has fully loaded, display it
                      return child;
                    } else if (newsDetailImage == null ||
                        newsDetailImage.isEmpty) {
                      // If the URL is empty or null, display an error image
                      return Image.asset('assets/images/News-replacement.jpg');
                    } else {
                      // If the URL is not empty but the image is still loading,display a loading indicator
                      return Padding(
                        padding: const EdgeInsets.all(15),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                  },
                  errorBuilder: (BuildContext context, Object error,
                      StackTrace? stackTrace) {
                    // If an error occurs while loading the image, you can display an error image or a placeholder
                    return Image.asset(
                        'assets/images/News-replacement.jpg'); // You can create your own ErrorImageWidget
                  },
                  fit: BoxFit.cover,
                  height: 280,
                  width: double.infinity,
                ),
              ),
              const SizedBox(
                height: defautPadding * 0.8,
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  newsAuthor,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
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
              MyButton(
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
