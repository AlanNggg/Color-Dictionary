import 'package:flutter/material.dart';
import './dialog.dart';
import './form.dart';
import './main.dart';

class PageTwo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  Color _color;

  @override
  void initState() {
    super.initState();
    _color = null;
  }

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
                  onTap: () {
                    print("yes");
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        final ThemeData themeData = Theme.of(context);
                        Color color;
                        if (_color == null)
                          color = themeData.textTheme.display1.color;
                        else
                          color = _color;
                        return new SingleChildScrollView(
                          child: new AlertDialog(
                            title: new Text('Create Dictionary'),
                            content: new DictionarySettingsDrawer(
                                activeColor: color,
                                onChangeColor: _updateColor),
                                
                            actions: <Widget>[
                              new FlatButton(
                                child: new Text('OK'),
                                onPressed: () {
                                  print(_color);
                                  Navigator.of(context).pop(true);
                                },
                              )
                            ],
                          )
                        );
                      },
                    );
                    print("no");
                  },
                  child: new Padding(
                    padding: EdgeInsets.only(
                        top: 20.0, bottom: 10.0, left: 20.0, right: 20.0),
                    child: new Column(
                      children: <Widget>[
                        new Text(
                          "建立單字本",
                          style: TextStyle(fontSize: 30.0),
                        )
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
                  onTap: () {
                    commonVocab(context);
                  },
                  child: new Padding(
                    padding: EdgeInsets.only(
                        top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                    child: new Column(
                      children: <Widget>[
                        new Text(
                          "分享單字本",
                          style: TextStyle(fontSize: 30.0),
                        )
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
  void _updateColor(Color color) {
    setState(() {
      _color = color;
    });
  }
}
