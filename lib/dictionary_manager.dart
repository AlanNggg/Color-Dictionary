import 'package:flutter/material.dart';

import './dictionary.dart';

class DictionaryManager extends StatefulWidget {

  final String type;
  final String title;

  DictionaryManager(this.type, this.title);

  @override
  State<StatefulWidget> createState() {
    return _DictionaryManagerState();
  }
}

class _DictionaryManagerState extends State<DictionaryManager> {
  List<String> _dictionaries = [];

  String type;

  String title;

  @override
  void initState() {
    type = widget.type;
    title = widget.title;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_dictionaries.length <= 0) {
      return new Center(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    margin: const EdgeInsets.only(right: 20.0),
                    child: new FloatingActionButton(
                      heroTag: type,
                      onPressed: () {
                        setState(() {
                          _dictionaries.add("New Dictionary");
                        });
                      },
                      child: new Icon(Icons.add),
                    )
                  ),
                  new Text(
                    title,
                    style: new TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 30.0,
                      color: Colors.grey
                    ),
                  )
                ],
              )
      );
    } else {
      return new Column(
        children: <Widget>[
          new Expanded(
            child: Dictionary(_dictionaries)
          )
        ],
      );
    }
  }
}