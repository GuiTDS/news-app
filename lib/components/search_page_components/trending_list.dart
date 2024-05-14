import 'package:flutter/material.dart';
import 'package:inews/components/search_page_components/trend_card.dart';

class TrendingList extends StatelessWidget {
  final String listTitle;
  final List<String> topics;
  const TrendingList({super.key, required this.listTitle, required this.topics});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          listTitle,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: SizedBox(
            height: 30,
            child: ListView.separated(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => TrendCard(title: topics[index],),
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
              itemCount: topics.length,
            ),
          ),
        ),
      ],
    );
  }
}
