import 'package:daily_news/components/constant.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewsTile extends StatelessWidget {
  dynamic newsImage, newsSource, newsTitle;
  NewsTile({
    super.key,
    required this.newsImage,
    required this.newsSource,
    required this.newsTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
        left: 15,
        right: 15,
        bottom: 10,
      ),
      decoration: BoxDecoration(
          border: Border.all(
            style: BorderStyle.solid,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(22)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(7),
            // child: CachedNetworkImage(
            //   height: 170,
            //   width: double.infinity,
            //   fit: BoxFit.cover,
            //   imageUrl: newsImage,
            //   placeholder: (context, url) => CircularProgressIndicator(),
            //   errorWidget: (context, url, error) => Icon(Icons.error),
            // ),
            child: Image.network(
              newsImage,
              fit: BoxFit.cover,
              height: 170,
              width: double.infinity,
            ),
          ),
          const SizedBox(
            height: defautPadding,
          ),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  style: BorderStyle.solid,
                  width: 1,
                ),
                color: Colors.grey[400]),
            child: Text(
              newsSource,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            height: defautPadding,
          ),
          Text(
            newsTitle,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
