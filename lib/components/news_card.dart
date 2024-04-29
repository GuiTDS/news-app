import 'package:flutter/material.dart';
import 'package:inews/models/news_model.dart';
import 'package:inews/pages/news_details_page.dart';

class NewsCard extends StatelessWidget {
  final NewsModel news;
  const NewsCard({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String categoryName = news.newsCategory.toString().split('.').last;
    categoryName = categoryName[0].toUpperCase() + categoryName.substring(1);
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NewsDetailsPage(news: news),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.person),
              const SizedBox(
                width: 10,
              ),
              Text(
                news.authorName,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  news.newsTitle,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                width: 60,
              ),
              SizedBox(
                height: 80,
                width: 80,
                child: Image.network(
                  news.newsImageURL,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey,
                      child: const Icon(Icons.error),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey[50],
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 2,
                  horizontal: 10,
                ),
                child: Text(
                  categoryName,
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '30 Sept 2024',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.blueGrey[600],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
