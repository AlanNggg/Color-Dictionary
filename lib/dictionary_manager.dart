import 'package:flutter/material.dart';

import './dictionaries.dart';

class DictionaryManager extends StatefulWidget {
  final List<Dictionary> dictionaries;

  final String type;
  final String title;

  DictionaryManager(
    Key key,
    this.dictionaries,
    this.type, 
    this.title
  ):super(key: key);

  @override
  State<StatefulWidget> createState() => _DictionaryManagerState();
}

class _DictionaryManagerState extends State<DictionaryManager> {

  String type;
  String title;
  int id;

  @override
  void initState() {
    type = widget.type;
    title = widget.title;

    if (widget.dictionaries.length > 0) {
      id = widget.dictionaries[widget.dictionaries.length - 1].id;
    } else {
      id = 0;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.dictionaries.length <= 0) {
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
                    widget.dictionaries.add(Dictionary(id, "New Dictionary"));
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
            child: new Dictionaries(
              this.widget.key,
              this.widget.dictionaries,
            )
          )
        ],
      );
    }
  }
}
