import 'package:flutter/material.dart';
import './form.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';

// Color _color;

// class PersonalVocab extends StatefulWidget {

//   PersonalVocab();

//   @override
//   PersonalVocabState createState() => new PersonalVocabState();
// }

// class PersonalVocabState extends State<PersonalVocab> {
//   @override
//   void initState() {
//     super.initState();
//     new Future.delayed(Duration.zero,() {
//       showDialog(
//         context:context,
//         builder:(BuildContext context) {
//           final ThemeData themeData = Theme.of(context);
//           final Color color = _color ?? themeData.textTheme.display1.color;
//           return new AlertDialog(
//             title: new Text('Permission'),
//             content: new DictionarySettingsDrawer(activeColor: color, onChangeColor: _updateClockColor),
//             actions: <Widget>[        
//               new FlatButton(
//                 child:new Text('OK'),
//                 onPressed: (){
//                   print(_color);
//                   Navigator.of(context).pop(true);
//                 },
//               )
//             ],
            
//           );
//         },
//       );
//     });
    
//   }


//   void _updateClockColor(Color color) {
//     setState(() {
//       _color = color;
//     });
//   }

//   _showDialog() async {
//     await showDialog(
//       context:context,
//       builder:(BuildContext context) {
//         final ThemeData themeData = Theme.of(context);
//         final Color color = _color ?? themeData.textTheme.display1.color;
//         return new CupertinoAlertDialog(
//           title: new Text('Permission'),
//           content: new DictionarySettingsDrawer(activeColor: color, onChangeColor: _updateClockColor),
//           actions: <Widget>[        
//             new FlatButton(
//               child:new Text('OK'),
//               onPressed: (){
//                 print(_color);
//                 Navigator.of(context).pop(true);
//               },
//             )
//           ],
          
//         );
//       },
//       barrierDismissible: false,
//     );
//     print("init");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Opacity(
//       opacity: 0.0,
//     );
//   }
  
// }



void commonVocab(BuildContext context){
  showDialog(
    context:context,
    builder:(BuildContext context){
      return new AlertDialog(
        title: new Text('Permission'),
        
        actions: <Widget>[
          
          new FlatButton(
            child:new Text('OK'),
            onPressed: (){
              Navigator.of(context).pop(true);
            },
          )
        ],
      );
    }
  );
}

