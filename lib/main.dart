import 'package:flutter/material.dart';

import './page_one.dart';

import './page_two.dart';

import './page_three.dart';

void main() => runApp(new MainPage());

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NavigationPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NavigationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Navigation();
}

class Navigation extends State<NavigationPage> {
  int currentIndex = 0;

  PageController pageController;
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      
      body: new PageView(
        children: [
          // My Dictionary
          PageOne(),
          // Page Two
          PageTwo(),
          // Page Three
          // Search
          PageThree()
        ],
        physics: new AlwaysScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: page,
        onTap: onTap,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            title: Text('個人字典'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text('新增個人字典'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('查字典'),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    pageController = new PageController();
  }

  void onTap(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPageChanged(int page) {
    setState(() {
      this.page = page;
    });
  }
}
