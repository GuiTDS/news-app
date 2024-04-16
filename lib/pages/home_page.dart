import 'package:flutter/material.dart';
import 'package:inews/components/main_infos.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double imageProportion = 0.55;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: size.height * imageProportion,
              floating: false,
              pinned: true,
              backgroundColor: Colors.blueGrey[200],
              title: const Text(
                'inews',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Opacity(
                      opacity: 1.0,
                      child: Image.asset(
                        'assets/images/news-image-background.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        color: Colors.black.withOpacity(0.2),
                      ),
                    ),
                    Positioned.fill(
                        top: size.height * 0.37, child: const MainInfos()),
                  ],
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () => print(''),
                  icon: const Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ];
        },
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 10, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Latest News',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: newsTypes.map((type) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      type,
                      style:
                          const TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                  );
                }).toList(),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.separated(
                  itemBuilder: (context, index) => const Text('test'),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
                  itemCount: 50,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<String> newsTypes = [
  'All',
  'Football',
  'Health',
  'Politics',
  'Food',
  'House',
  'Travel'
];
