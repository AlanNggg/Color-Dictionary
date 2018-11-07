import 'package:flutter/material.dart';

import './page_one.dart';

import './page_two.dart';

import './page_three.dart';

import './model/dictionary.dart';

import './ScanScreen.dart';

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

  final Key keyOne = PageStorageKey("pageOne");
  final Key keyTwo = PageStorageKey("pageTwo");
  final Key keyThree = PageStorageKey("pageThree");

  PageController pageController;
  int page = 0;

  PageOne one;
  PageTwo two;
  PageThree three;
  List<Widget>pages;
  Widget currentPage;

  List<Dictionary> dictionaries;
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    dictionaries = [];
    one = PageOne(
      key: keyOne,
      dictionaries: dictionaries,
    );
    two = PageTwo();
    three = PageThree();

    pages = [one, two, three];

    pageController = new PageController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      
      body: new PageView(
        children: [
          new PageStorage(
            child: one,
            bucket: bucket,
          ),
          new PageStorage(
            child: two,
            bucket: bucket,
          ),
          new PageStorage(
            child: three,
            bucket: bucket,
          ),
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
  void dispose() {
    pageController.dispose();
    super.dispose();
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
