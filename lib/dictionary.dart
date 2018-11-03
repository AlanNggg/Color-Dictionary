import 'package:flutter/material.dart';

class Dictionary extends StatelessWidget {
  final List<String> _dictionaries = [];

  Dictionary(List<String> _dictionaries) {
    this._dictionaries.addAll(_dictionaries.toList());
  }

  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: _dictionaries
          .map((element) => new Card(
              elevation: 5.0,
              margin: EdgeInsets.all(20.0),
              child: new Padding(
                padding: new EdgeInsets.all(40.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      element,
                      style: TextStyle(fontSize: 30.0),
                      textAlign: TextAlign.start,
                    ),
                  ],
                )
              ),
            )
          )
          .toList(),
    );
  }
}
