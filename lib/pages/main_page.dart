import 'package:flutter/material.dart';
import 'package:inews/pages/home_page.dart';
import 'package:inews/pages/profile_page.dart';
import 'package:inews/pages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _selectedIndex = 0;

  changeIndex(int index) {
    setState(() {
      _selectedIndex = index;
      if (index != 1) {
        _pageController.animateToPage(index,
            duration: const Duration(milliseconds: 400), curve: Curves.ease);
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SearchPage(),
            ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomePage(),
          SearchPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.book,
                color: Colors.black,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              label: ''),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) => changeIndex(index),
      ),
    );
  }
}
