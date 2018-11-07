import 'package:flutter/material.dart';

import './model/dictionary.dart';

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
        return new Stack( 
          fit: StackFit.passthrough,
          children: <Widget>[     
            new Card(
              margin: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
              elevation: 5.0,
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: new InkWell( 
                onTap:(){
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Tap'),
                  ));
                },
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
              )
            ),
            new Container(
              alignment: new FractionalOffset(1.0, 0.0),
              margin: const EdgeInsets.only(left: 24.0),
              child: new Image(
                image: new AssetImage(widget.dictionaries[index].image),
                height: 70.0,
                width: 70.0,
              ),
            ),
          ] 
        );
      } //itemBuilder
    );
  }
}


