import 'package:flutter/material.dart';

typedef ColorCallback(Color color);

class DictionarySettingsDrawer extends StatefulWidget {

  Color activeColor;
  
  DictionarySettingsDrawer({
    Key key,
    this.activeColor,
    this.onChangeColor,
  });
  
  final ColorCallback onChangeColor;

  @override
  State createState() => new ColorPickerState();
}

class ColorPickerState extends State<DictionarySettingsDrawer> {
  List<Widget> list = new List();
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    final ThemeData themeData = Theme.of(context);

    final TextEditingController _controller = new TextEditingController();

    List<Color> colors = [
      themeData.textTheme.display1.color,             
      Colors.red,
      Colors.orange,
      Colors.green,
      Colors.purple,
      Colors.blue,
      Colors.yellow
    ];

    BoxBorder border;
    setState(() {
      
      list = new List();
      for (Color color in colors) {
        if (widget.activeColor == color) 
          border = new Border.all(color: Colors.black, width: 2.0);
        else
          border = null;
        list.add(
          new GestureDetector(
            onTap: () {
              setState(() {                          
                widget.activeColor = color;
                widget.onChangeColor(color);
              });
            },
            child: new Container(
              padding: EdgeInsets.only(top: 0.0, bottom: 10.0, left: 5.0, right: 5.0),
              child: new SizedBox(
                width: 30.0,
                height: 30.0,
                child: new Container(                
                  decoration: new BoxDecoration(
                    color: color,
                    border: border,
                  ),
                ),
              ),
            )   
          )
        );  
      }
    });
    return new Column(
      children: [
        new Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Row(
            children: <Widget>[
              new Text("Color", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),)
            ],
          ),
        ),
        new Row(children: list),
        new Divider(),
        new Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Row(
            children: <Widget>[
              new Text("Name", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),)
            ],
          ),
        ),
        // new Row(
        //   children: [
        //     new Stack(
        //       alignment: const Alignment(1.0, 1.0),
        //       children: <Widget>[
        //         new TextField(controller: _controller,),
        //         new FlatButton(
        //           onPressed: () {
        //             _controller.clear();
        //           },
        //           child: new Icon(Icons.clear))
        //       ]
        //     )
        //   ]
        // ),
        new TextField()
      ]
    );
  }
}
