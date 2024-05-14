import 'package:flutter/material.dart';
import 'package:inews/components/search_page_components/news_location.dart';
import 'package:inews/components/search_page_components/trending_list.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: SizedBox(
          width: 230,
          height: 30,
          child: TextField(
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              hintText: 'Search any news',
              hintStyle: TextStyle(fontSize: 12, color: Colors.blueGrey[700]),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
              ),
              prefixIcon: const Icon(Icons.search_outlined),
              suffixIcon: const Icon(
                Icons.mic_none_outlined,
              ),
              isDense: true,
              contentPadding: const EdgeInsets.only(right: 5),
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(
              right: 30,
            ),
            child: Text(
              'Search',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 25,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Trending',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TrendingList(
              listTitle: 'People',
              topics: topicsList[0],
            ),
            const SizedBox(
              height: 15,
            ),
            TrendingList(
              listTitle: 'Companies',
              topics: topicsList[1],
            ),
            const SizedBox(
              height: 15,
            ),
            TrendingList(
              listTitle: 'Event',
              topics: topicsList[2],
            ),
            const SizedBox(
              height: 15,
            ),
            TrendingList(
              listTitle: 'Topics',
              topics: topicsList[3],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  'Show more',
                  style: TextStyle(
                    color: Colors.blueGrey,
                  ),
                ),
                IconButton(
                  padding: const EdgeInsets.only(right: 10),
                  onPressed: () => print('clicou'),
                  icon: const Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Location',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => const NewsLocation(),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemCount: 4),
            ),
          ],
        ),
      ),
    );
  }
}

List<List<String>> topicsList = [
  ['trump', 'Joe Bidden', 'Elon Musk', 'Bill Gates', 'Mark'],
  ['Apple', 'Xiaomi', 'HBO', 'Disney', 'Huawei', 'LG', 'Sony'],
  ['Valentines Day', 'Apple event', 'Huawei event', 'Facebook event'],
  [
    'Baseball',
    'Basketball',
    'Football',
    'Sports',
    'Health',
    'Politics',
    'Food'
  ],
];
