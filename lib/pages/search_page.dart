import 'package:flutter/material.dart';

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
            decoration: InputDecoration(
              labelText: 'Search any news',
              labelStyle: TextStyle(fontSize: 12, color: Colors.blueGrey[700]),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
              ),
              prefixIcon: const Icon(Icons.search_outlined),
              suffixIcon: const Icon(
                Icons.mic_none_outlined,
              ),
              isDense: true,
              contentPadding: const EdgeInsets.only(bottom: 5, right: 5),
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
            Row(
              children: [
                const Text('People'),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: SizedBox(
                    height: 20,
                    child: ListView.separated(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => const Text('text'),
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 10,
                      ),
                      itemCount: 15,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                const Text('Companies'),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: SizedBox(
                    height: 20,
                    child: ListView.separated(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => const Text('text'),
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 10,
                      ),
                      itemCount: 15,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                const Text('Event'),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: SizedBox(
                    height: 20,
                    child: ListView.separated(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => const Text('text'),
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 10,
                      ),
                      itemCount: 15,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                const Text('Topics'),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: SizedBox(
                    height: 20,
                    child: ListView.separated(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => const Text('text'),
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 10,
                      ),
                      itemCount: 15,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text('Show more', style: TextStyle(
                  color: Colors.blueGrey,
                ),),
                IconButton(
                  padding: const EdgeInsets.only(right: 10),
                    onPressed: () => print('clicou'),
                    icon: const Icon(Icons.keyboard_arrow_down_outlined, color: Colors.blueGrey,)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
