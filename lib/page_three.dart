import 'package:flutter/material.dart';

import './search.dart';

class PageThree extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("字典"),
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
    );
  }
}