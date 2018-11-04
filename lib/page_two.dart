import 'package:flutter/material.dart';

class PageTwo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("新增單字本"),
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new Expanded(
            child: new Container(
              margin: EdgeInsets.all(10.0),
              child: new Card(
                elevation: 7.0,

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
                    padding: EdgeInsets.only(top: 20.0, bottom: 10.0, left: 20.0, right: 20.0),
                    child: new Column(
                      children: <Widget>[
                        new Text("建立單字本", style: TextStyle(fontSize: 30.0),)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          new Expanded(
            child: new Container(
              margin: EdgeInsets.all(10.0),
              child: new Card(
                elevation: 7.0,

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
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                    child: new Column(
                      children: <Widget>[
                        new Text("分享單字本", style: TextStyle(fontSize: 30.0),)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
