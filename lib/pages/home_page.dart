import 'package:flutter/material.dart';
import 'package:inews/components/main_infos.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Opacity(
              opacity: 1.0,
              child: Image.asset(
                'assets/images/news-image-background.jpg',
                height: size.height * imageProportion,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Opacity(
              opacity: 0.2,
              child: Container(
                height: size.height * imageProportion,
                color: Colors.black,
              ),
            ),
          ),
          AppBar(
            title: const Text('inews'),
            foregroundColor: Colors.white,
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(
                  onPressed: () => print(''),
                  icon: const Icon(Icons.notifications_none_outlined)),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: size.height * 0.35,
              ),
              const MainInfos(),
            ],
          )
        ],
      ),
    );
  }
}
