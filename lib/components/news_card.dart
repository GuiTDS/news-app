import 'package:flutter/material.dart';
import 'package:inews/models/news_model.dart';
import 'package:inews/pages/news_details_page.dart';

class NewsCard extends StatefulWidget {
  final NewsModel news;
  const NewsCard({super.key, required this.news});

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const NewsDetailsPage(),
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
              Text(widget.news.authorName),
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
                  widget.news.newsTitle,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                width: 60,
              ),
              SizedBox(
                  height: 80,
                  width: 80,
                  child: Image.network(widget.news.newsImageURL,
                      fit: BoxFit.cover)),
            ],
          )
        ],
      ),
    );
  }
}
