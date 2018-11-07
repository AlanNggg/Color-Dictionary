import 'package:flutter/material.dart';

import './dictionary_manager.dart';

import './search.dart';

import './model/dictionary.dart';

import 'package:sqflite/sqflite.dart';

class PageOne extends StatefulWidget {
  final List<Dictionary> dictionaries;

  PageOne({
    Key key, 
    this.dictionaries
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: new PageStorageKey(_PageOneState),
      appBar: AppBar(
        title: Text("你的單字本"),
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
          // Add Dictionary by using Dictionary Manager
          new Row(
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text("個人單字本", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              )
            ],
          ),
          new Expanded(
            child: new DictionaryManager(
              this.widget.key,
              this.widget.dictionaries,
              "My Vocabulary", 
              "建立單字本"
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
          new Row(
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text("推薦單字本", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              )
            ],
          ),
          new Expanded(
            child: new DictionaryManager(
              this.widget.key,
              this.widget.dictionaries,
              "Recommand Vocabulary", 
              "取得單字本"
            ),
          )
        ],
      )
    );
  }
}
