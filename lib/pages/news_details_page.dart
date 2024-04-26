import 'package:flutter/material.dart';
import 'package:inews/models/news_model.dart';

class NewsDetailsPage extends StatelessWidget {
  final NewsModel news;
  const NewsDetailsPage({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double appBarIconsHorizPadding = 10;
    Color appBarIconsColor = Colors.white;
    double newsTitleSpace = news.newsTitle.length >= 65 ? 0.25 : 0.3;
    double textHorizontalPadding = 15;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: size.height * 0.4,
              floating: false,
              pinned: false,
              backgroundColor: Colors.blueGrey,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: appBarIconsColor,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Opacity(
                      opacity: 1,
                      child: Image.network(
                        news.newsImageURL,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ),
                    Positioned.fill(
                      top: size.height * newsTitleSpace,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.90,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 0,
                                  ),
                                  child: Text(
                                    news.newsTitle,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      overflow: TextOverflow.clip,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: appBarIconsHorizPadding,
                  ),
                  child: Icon(
                    Icons.share,
                    color: appBarIconsColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: appBarIconsHorizPadding,
                  ),
                  child: Icon(
                    Icons.headphones,
                    color: appBarIconsColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: appBarIconsHorizPadding,
                  ),
                  child: Icon(
                    Icons.more_horiz,
                    color: appBarIconsColor,
                  ),
                ),
              ],
            ),
          ];
        },
        body: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: textHorizontalPadding,
                  top: 10,
                  bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          news.authorName,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const Text(
                          'Today at 11:40 AM',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/journalist.jpg'))),
                      width: 80,
                      height: 35,
                    ),
                  ],
                ),
              ),
              Container(
                width: size.width,
                color: Colors.blueGrey[50],
                height: 2,
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.only(
                    top: textHorizontalPadding,
                    left: textHorizontalPadding,
                    right: textHorizontalPadding,
                    bottom: 65,
                  ),
                  children: [
                    Text(
                      newsText,
                      style: TextStyle(color: Colors.blueGrey[600]),
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 35,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.white,
              elevation: 1,
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.21),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 9, horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.favorite_border_outlined),
                    Icon(Icons.message_outlined),
                    Icon(Icons.bookmark_border_outlined),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

String newsText =
    'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sint quis accusamus ipsum? Dolor iusto officia sint nesciunt quibusdam ipsam ex, perferendis quia! Eaque cum nesciunt eveniet repudiandae perspiciatis aliquam consequuntur!\nLorem ipsum dolor sit amet consectetur, adipisicing elit. Sint quis accusamus ipsum? Dolor iusto officia sint nesciunt quibusdam ipsam ex, perferendis quia! Eaque cum nesciunt eveniet repudiandae perspiciatis aliquam consequuntur!Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sint quis accusamus ipsum? Dolor iusto officia sint nesciunt quibusdam ipsam ex, perferendis quia! Eaque cum nesciunt eveniet repudiandae perspiciatis aliquam consequuntur!\nLorem ipsum dolor sit amet consectetur, adipisicing elit. Sint quis accusamus ipsum? Dolor iusto officia sint nesciunt quibusdam ipsam ex, perferendis quia! Eaque cum nesciunt eveniet repudiandae perspiciatis aliquam consequuntur!Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sint quis accusamus ipsum? Dolor iusto officia sint nesciunt quibusdam ipsam ex, perferendis quia! Eaque cum nesciunt eveniet repudiandae perspiciatis aliquam consequuntur!\nLorem ipsum dolor sit amet consectetur, adipisicing elit. Sint quis accusamus ipsum? Dolor iusto officia sint nesciunt quibusdam ipsam ex, perferendis quia! Eaque cum nesciunt eveniet repudiandae perspiciatis aliquam consequuntur!Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sint quis accusamus ipsum? Dolor iusto officia sint nesciunt quibusdam ipsam ex, perferendis quia! Eaque cum nesciunt eveniet repudiandae perspiciatis aliquam consequuntur!\nLorem ipsum dolor sit amet consectetur, adipisicing elit. Sint quis accusamus ipsum? Dolor iusto officia sint nesciunt quibusdam ipsam ex, perferendis quia! Eaque cum nesciunt eveniet repudiandae perspiciatis aliquam consequuntur!\nLorem ipsum dolor sit amet consectetur, adipisicing elit. Sint quis accusamus ipsum? Dolor iusto officia sint nesciunt quibusdam ipsam ex, perferendis quia! Eaque cum nesciunt eveniet repudiandae perspiciatis aliquam consequuntur!Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sint quis accusamus ipsum? Dolor iusto officia sint nesciunt quibusdam ipsam ex, perferendis quia! Eaque cum nesciunt eveniet repudiandae perspiciatis aliquam consequuntur!\n';
