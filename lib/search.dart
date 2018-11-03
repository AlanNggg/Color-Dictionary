import 'package:flutter/material.dart';

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