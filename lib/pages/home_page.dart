import 'package:flutter/material.dart';
import 'package:inews/components/main_infos.dart';
import 'package:inews/components/news_card.dart';
import 'package:inews/models/news_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedNewsCategory = newsTypes[0];

  changeCategory(String category) {
    setState(() {
      selectedNewsCategory = category;
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
              backgroundColor: Colors.blueGrey,
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
                  return InkWell(
                    onTap: () => changeCategory(type),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Text(
                        type,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            fontWeight: selectedNewsCategory == type
                                ? FontWeight.bold
                                : FontWeight.normal),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.separated(
                  itemBuilder: (context, index) =>
                      NewsCard(news: newsItems[index]),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
                  itemCount: newsItems.length,
                ),
              ),
            ),
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

List<NewsModel> newsItems = [
  const NewsModel(
    authorName: 'Alexandra',
    newsTitle:
        '5 things to know for April 23: Trump trial, Gaza, Ukraine, Health care privacy, Dubai floods',
    newsImageURL:
        'https://www.cnnbrasil.com.br/wp-content/uploads/sites/12/Reuters_Direct_Media/BrazilOnlineReportWorldNews/tagreuters.com2024binary_LYNXNPEK1R0SA-FILEDIMAGE-e1709163448930.jpg?w=1220&h=674&crop=1',
  ),
  const NewsModel(
    authorName: 'Alexandra',
    newsTitle:
        '5 things to know for April 23: Trump trial, Gaza, Ukraine, Health care privacy, Dubai floods',
    newsImageURL:
        'https://www.cnnbrasil.com.br/wp-content/uploads/sites/12/Reuters_Direct_Media/BrazilOnlineReportWorldNews/tagreuters.com2024binary_LYNXNPEK1R0SA-FILEDIMAGE-e1709163448930.jpg?w=1220&h=674&crop=1',
  ),
  const NewsModel(
    authorName: 'Alexandra',
    newsTitle:
        '5 things to know for April 23: Trump trial, Gaza, Ukraine, Health care privacy, Dubai floods',
    newsImageURL:
        'https://www.cnnbrasil.com.br/wp-content/uploads/sites/12/Reuters_Direct_Media/BrazilOnlineReportWorldNews/tagreuters.com2024binary_LYNXNPEK1R0SA-FILEDIMAGE-e1709163448930.jpg?w=1220&h=674&crop=1',
  ),
  const NewsModel(
    authorName: 'Alexandra',
    newsTitle:
        '5 things to know for April 23: Trump trial, Gaza, Ukraine, Health care privacy, Dubai floods',
    newsImageURL:
        'https://www.cnnbrasil.com.br/wp-content/uploads/sites/12/Reuters_Direct_Media/BrazilOnlineReportWorldNews/tagreuters.com2024binary_LYNXNPEK1R0SA-FILEDIMAGE-e1709163448930.jpg?w=1220&h=674&crop=1',
  ),
  const NewsModel(
    authorName: 'Alexandra',
    newsTitle:
        '5 things to know for April 23: Trump trial, Gaza, Ukraine, Health care privacy, Dubai floods',
    newsImageURL:
        'https://www.cnnbrasil.com.br/wp-content/uploads/sites/12/Reuters_Direct_Media/BrazilOnlineReportWorldNews/tagreuters.com2024binary_LYNXNPEK1R0SA-FILEDIMAGE-e1709163448930.jpg?w=1220&h=674&crop=1',
  ),
  const NewsModel(
    authorName: 'Alexandra',
    newsTitle:
        '5 things to know for April 23: Trump trial, Gaza, Ukraine, Health care privacy, Dubai floods',
    newsImageURL:
        'https://www.cnnbrasil.com.br/wp-content/uploads/sites/12/Reuters_Direct_Media/BrazilOnlineReportWorldNews/tagreuters.com2024binary_LYNXNPEK1R0SA-FILEDIMAGE-e1709163448930.jpg?w=1220&h=674&crop=1',
  ),
  const NewsModel(
    authorName: 'Alexandra',
    newsTitle:
        '5 things to know for April 23: Trump trial, Gaza, Ukraine, Health care privacy, Dubai floods',
    newsImageURL:
        'https://www.cnnbrasil.com.br/wp-content/uploads/sites/12/Reuters_Direct_Media/BrazilOnlineReportWorldNews/tagreuters.com2024binary_LYNXNPEK1R0SA-FILEDIMAGE-e1709163448930.jpg?w=1220&h=674&crop=1',
  ),
  const NewsModel(
    authorName: 'Alexandra',
    newsTitle:
        '5 things to know for April 23: Trump trial, Gaza, Ukraine, Health care privacy, Dubai floods',
    newsImageURL:
        'https://www.cnnbrasil.com.br/wp-content/uploads/sites/12/Reuters_Direct_Media/BrazilOnlineReportWorldNews/tagreuters.com2024binary_LYNXNPEK1R0SA-FILEDIMAGE-e1709163448930.jpg?w=1220&h=674&crop=1',
  ),
  const NewsModel(
    authorName: 'Alexandra',
    newsTitle:
        '5 things to know for April 23: Trump trial, Gaza, Ukraine, Health care privacy, Dubai floods',
    newsImageURL:
        'https://www.cnnbrasil.com.br/wp-content/uploads/sites/12/Reuters_Direct_Media/BrazilOnlineReportWorldNews/tagreuters.com2024binary_LYNXNPEK1R0SA-FILEDIMAGE-e1709163448930.jpg?w=1220&h=674&crop=1',
  ),
];
