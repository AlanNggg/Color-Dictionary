import 'package:flutter/material.dart';

class Dictionaries extends StatefulWidget {

  final List<Dictionary> dictionaries;

  Dictionaries(
    Key key,
    this.dictionaries,
  ):super(key: key);

  @override
  State<StatefulWidget> createState() => _DictionariesState();

}

class _DictionariesState extends State<Dictionaries> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.dictionaries.length,
      itemBuilder: (context, index) {
        return new Card(
          elevation: 5.0,
          margin: EdgeInsets.all(20.0),
          child: new Padding(
            padding: new EdgeInsets.all(40.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  widget.dictionaries[index].title,
                  style: TextStyle(fontSize: 30.0),
                  textAlign: TextAlign.start,
                ),
              ],
            )
          ),
        );
      },
    );
  }
}

class Dictionary {
  final int id;
  final String title;

  Dictionary(this.id, this.title);
}
