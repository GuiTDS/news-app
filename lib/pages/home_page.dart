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
  NewsCategory selectedNewsCategory = NewsCategory.all;
  List<NewsModel> actualNewsList = newsItems;

  changeCategory(NewsCategory category) {
    if (category != selectedNewsCategory) {
      setState(() {
        selectedNewsCategory = category;
        if (selectedNewsCategory != NewsCategory.all) {
          actualNewsList = newsItems
              .where((news) => news.newsCategory == selectedNewsCategory)
              .toList();
        } else {
          actualNewsList = newsItems;
        }
      });
    }
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
                'iNews',
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
                children: NewsCategory.values.map((type) {
                  String typeName = type.toString().split('.').last;
                  typeName = typeName[0].toUpperCase() + typeName.substring(1);
                  return InkWell(
                    onTap: () => changeCategory(type),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Container(
                        // color: Colors.blueGrey[200],
                        child: Text(
                          typeName,
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                              fontWeight: selectedNewsCategory == type
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 10,
                ),
                child: ListView.separated(
                  itemBuilder: (context, index) =>
                      NewsCard(news: actualNewsList[index]),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
                  itemCount: actualNewsList.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<NewsModel> newsItems = [
  const NewsModel(
    authorName: 'Alexandra Lorem',
    newsCategory: NewsCategory.politics,
    newsTitle:
        '5 things to know for April 23: Trump trial, Gaza, Ukraine, Health care privacy, Dubai floods',
    newsImageURL:
        'https://www.cnnbrasil.com.br/wp-content/uploads/sites/12/Reuters_Direct_Media/BrazilOnlineReportWorldNews/tagreuters.com2024binary_LYNXNPEK1R0SA-FILEDIMAGE-e1709163448930.jpg?w=1220&h=674&crop=1',
  ),
  const NewsModel(
    authorName: 'Alex Lorem',
    newsTitle:
        'Arizona House votes to overturn century-old abortion ban, paving way to leave 15-week limit in place',
    newsCategory: NewsCategory.politics,
    newsImageURL:
        'https://www.shutterstock.com/shutterstock/photos/1513189949/display_1500/stock-photo-rear-view-of-people-with-placards-and-posters-on-global-strike-for-climate-change-1513189949.jpg',
  ),
  const NewsModel(
    authorName: 'Max Lorem',
    newsTitle:
        'In 50-50 Georgia, unhappiness with the choices but urgency about voting',
    newsCategory: NewsCategory.politics,
    newsImageURL:
        'https://static.vecteezy.com/ti/vetor-gratis/p1/9952525-politico-desenho-desenhado-a-mao-ilustracao-com-eleicao-e-governanca-democratica-ideias-participar-em-debates-politicos-na-frente-da-plateia-vetor.jpg',
  ),
  const NewsModel(
    authorName: 'Erick Lorem',
    newsCategory: NewsCategory.politics,
    newsTitle:
        'Trump’s immunity case is another reminder that all roads now lead to the Supreme Court',
    newsImageURL:
        'https://s4.static.brasilescola.uol.com.br/be/2023/01/fachada-norte-da-casa-branca-em-washington-dc-nos-estados-unidos.jpg',
  ),
  const NewsModel(
    authorName: 'Jill Lorem',
    newsCategory: NewsCategory.sports,
    newsTitle:
        'Reggie Bush getting 2005 Heisman Trophy back, Heisman Trust cites ‘enormous changes in college athletics’',
    newsImageURL:
        'https://media.bleacherreport.com/image/upload/v1625172891/jvz13uzntcuxvkzfe9yk.jpg',
  ),
  const NewsModel(
    authorName: 'Alexandra Lorem',
    newsCategory: NewsCategory.sports,
    newsTitle:
        'NBA and Denver Police ‘looking into’ reported incident involving brother of two-time MVP Nikola Jokić',
    newsImageURL:
        'https://mpcrio.com/wp-content/uploads/2023/10/GettyImages-1438226167-scaled.jpg',
  ),
  const NewsModel(
    authorName: 'Alexandra Lorem',
    newsCategory: NewsCategory.health,
    newsTitle:
        'FDA finds traces of H5N1 bird flu viruses in grocery store milk but says pasteurized dairy products are still safe',
    newsImageURL:
        'https://cloudfront-us-east-1.images.arcpublishing.com/cmg/QAALG2RSZRB6PJPLKKQVN3QNWI.jpg',
  ),
  const NewsModel(
    authorName: 'Alexandra Lorem',
    newsCategory: NewsCategory.health,
    newsTitle: 'Stretching isn’t always the answer for pain and muscle tension',
    newsImageURL:
        'https://mybeachlifechiro.com/wp-content/uploads/2023/07/stretching-woman.jpg',
  ),
  const NewsModel(
    authorName: 'Alexandra Lorem',
    newsCategory: NewsCategory.food,
    newsTitle:
        '3 in 5 families are short-order cooks for picky kids. Here’s what to do instead',
    newsImageURL:
        'https://www.wonderbaby.org/wp-content/uploads/2023/06/Happy-family-enjoying-weekend-breakfast-together.jpg',
  ),
  const NewsModel(
    authorName: 'Alexandra Lorem',
    newsCategory: NewsCategory.travel,
    newsTitle:
        'They’d never traveled with their kids before. Here’s what happened when they took them around the world for a year',
    newsImageURL:
        'https://as1.ftcdn.net/v2/jpg/02/10/32/56/1000_F_210325664_ozxnrMa1BRJdp9y9oZ1OTrOoDsFBt8hX.jpg',
  ),
];
