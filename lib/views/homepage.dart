import 'package:daily_news/models/category.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Daily',
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
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: SizedBox(
              height: 110,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: categoryCard.length,
                itemBuilder: (context, index) {
                  return categorySection(categoryCard[index], context);
                },
              ),
            ),
          ),
        ],
      )),
    );
  }
}

categorySection(Category category, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.pushNamed(context, '/secondRoute');
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
