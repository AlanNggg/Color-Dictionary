import 'package:flutter/material.dart';

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
          new Scaffold(
              appBar: AppBar(
                title: Text("Dictionary"),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.search), 
                    onPressed: () {
                      showSearch(context: context, delegate: DictionarySearch());
                    }
                  )
                ],
              ),
              body: new Column(
                children: <Widget>[
                  new Expanded(
                    child: new Center(
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(right: 20.0),
                            child: new FloatingActionButton(
                              heroTag: "Vocabulary",
                              onPressed: () {},
                              child: new Icon(Icons.add),
                            )
                          ),
                          new Text(
                            "建立個人字典",
                            style: new TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 30.0,
                              color: Colors.grey
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  new SizedBox(
                    height: 10.0,
                    child: new Center(
                      child: new Container(
                        margin: new EdgeInsetsDirectional.only(start: 2.0, end: 2.0),
                        height: 5.0,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  new Expanded(
                    child: new Center(
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(right: 20.0),
                            child: new FloatingActionButton(
                              heroTag: "Important Vocabulary",
                              onPressed: () {},
                              child: new Icon(Icons.add),
                            )
                          ),
                          new Text(
                            "建立推薦字典",
                            style: new TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 30.0,
                              color: Colors.grey
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
          ),
          new Scaffold(
              appBar: AppBar(
                title: Text("Word"),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.search), 
                    onPressed: () {
                      showSearch(context: context, delegate: WordSearch());
                    }
                  )
                ],
              ),
              body: new Column(
                children: <Widget>[
                  new Expanded(
                    child: new Center(
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(right: 20.0),
                            child: new FloatingActionButton(
                              heroTag: "Word",
                              onPressed: () {},
                              child: new Icon(Icons.add),
                            )
                          ),
                          new Text(
                            "Create Dictionary",
                            style: new TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 30.0,
                              color: Colors.grey
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  new SizedBox(
                    height: 10.0,
                    child: new Center(
                      child: new Container(
                        margin: new EdgeInsetsDirectional.only(start: 2.0, end: 2.0),
                        height: 5.0,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  new Expanded(
                    child: new Center(
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(right: 20.0),
                            child: new FloatingActionButton(
                              heroTag: "Meaning",
                              onPressed: () {},
                              child: new Icon(Icons.add),
                            )
                          ),
                          new Text(
                            "Create Dictionary",
                            style: new TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 30.0,
                              color: Colors.grey
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
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
            title: Text('Dictionary'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
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

class WordSearch extends SearchDelegate<String> {
  final recentCities = [
    "new Delhi",
    "Fairdabad"
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear), 
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context,index) => ListTile(
        leading: Icon(Icons.book),
        title: Text(recentCities[index]),
      ),
      itemCount: recentCities.length,
    );
  }
    
}

class DictionarySearch extends SearchDelegate<String> {
  final recentCities = [
    "new Delhi",
    "Fairdabad"
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear), 
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context,index) => ListTile(
        leading: Icon(Icons.book),
        title: Text(recentCities[index]),
      ),
      itemCount: recentCities.length,
    );
  }
    
}

