import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodePage extends StatefulWidget {
  @override
  _MainScreenState createState() => new _MainScreenState();
}

// class _MainScreenState extends State<QRCodePage> {
//   @override
//   Widget build(BuildContext context){
//       return new Scaffold(
//         body:qrCard('{"1":"Apple","2":"orange","3":"pair"}')
//       );
//   }

//   Card qrCard(String _text){
    
//     return Card(
//         child: Center(
//               child: new QrImage(
//                 data: _text,
//                 size: 200.0,
//                 onError: (ex) {
//                   print("[QR] ERROR - $ex");
                  
//                 },
//               ),
//               )
//     );
//   }

  
  // static const double _topSectionTopPadding = 50.0;
  // static const double _topSectionBottomPadding = 20.0;
  // static const double _topSectionHeight = 50.0;

  // String _dataString = "Hello from this QR code!";
  // String _inputErrorText;
  // final TextEditingController _textController = new TextEditingController();

  // @override
  // Widget build(BuildContext context) {
  //   return new Scaffold(
  //     body: _contentWidget(),
  //     resizeToAvoidBottomPadding: true,
  //   );
  // }

  // @override
  // didUpdateWidget(Widget oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   setState(() {});
  // }

  // _contentWidget() {
  //   final bodyHeight = MediaQuery.of(context).size.height -
  //       MediaQuery.of(context).viewInsets.bottom;
  //   return new Container(
  //     color: const Color(0xFFFFFFFF),
  //     child: new Column(
  //       children: <Widget>[
  //         new Padding(
  //           padding: const EdgeInsets.only(
  //             top: _topSectionTopPadding,
  //             left: 20.0,
  //             right: 10.0,
  //             bottom: _topSectionBottomPadding,
  //           ),
  //           child: new Container(
  //             height: _topSectionHeight,
  //             child: new Row(
  //               mainAxisSize: MainAxisSize.max,
  //               crossAxisAlignment: CrossAxisAlignment.stretch,
  //               children: <Widget>[
  //                 new Expanded(
  //                   child: new TextField(
  //                     controller: _textController,
  //                     decoration: new InputDecoration(
  //                       hintText: "Enter a custom message",
  //                       errorText: _inputErrorText,
  //                     ),
  //                   ),
  //                 ),
  //                 new Padding(
  //                   padding: const EdgeInsets.only(left: 10.0),
  //                   child: new FlatButton(
  //                     child: new Text("SUBMIT"),
  //                     onPressed: () {
  //                       setState(() {
  //                         _dataString = _textController.text;
  //                         _inputErrorText = null;
  //                       });
  //                     },
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ),
  //         ),
  //         new Expanded(
  //           child: new Center(
  //             child: new QrImage(
  //               data: _dataString,
  //               onError: (ex) {
  //                 print("[QR] ERROR - $ex");
  //                 setState(() {
  //                   _inputErrorText =
  //                       "Error! Maybe your input value is too long?";
  //                 });
  //               },
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
//}

class _MainScreenState extends State<QRCodePage> {
  bool _hasCard;

  @override
  void initState() {
    super.initState();
    _hasCard = false;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = new List();

    children.add(_buildBackground());
    if (_hasCard) children.add(_buildCard('{"1":"Apple","2":"orange","3":"pair"}'));

    return MaterialApp(
      home: Stack(
        children: children,
      ),
    );
  }

  void _showCard() {
    setState(() => _hasCard = true);
  }

  void _hideCard() {
    setState(() => _hasCard = false);
  }

  Widget _buildCard(_text) => new Container(
        
        child: Card(
          margin: EdgeInsets.fromLTRB(100.0, 200.0, 100.0, 200.0),
          child: ListView(
            padding: EdgeInsets.all(10.0),
            children:[
                      Center(
                          child: new QrImage(
                            data: _text,
                            size: 150.0,
                            onError: (ex) {
                              print("[QR] ERROR - $ex");
                              
                            },
                          ),
                      ),
                      Text(
                        "You can share this QRcode to other people.",
                        style: TextStyle(
                                 fontSize: 12.0,
                                  fontWeight: FontWeight.w400,
                                  )
                      )
               ])
      )
      );

  Widget _buildBackground() => new Scaffold(
        appBar: new AppBar(
          title: new Text("AppBar"),
        ),
        body: new Container(
          child: _hasCard
              ? new FlatButton(
                  onPressed: _hideCard, child: new Text("Hide card"))
              : new FlatButton(
                  onPressed: _showCard, child: new Text("Show card")),
        ),
      );
}



// class QRPainter extends CustomPaint{
//   QRPainter(
//     String data;
//     this.color,
//     this.version,
//     this.errorCorrectionLevel
//   ) : this._qr = new QRCode()
// }


            
//             Future<Post> fetchPost() async{
             
//               final response = 
//               await http.get(Uri.encodeFull('http://terryyess.yabi.me/api/createQRcode.php'),headers: {"Cookie":"_text=THE_CONTENT_OF_YOU_COOKIE_HERE; expires=Thu, 31-Dec-37 23:55:55 GMT; path=/","Accept":"application/json"});
              
              
//               if(response.statusCode ==200){
//                 print(response.body);
//                   return Post.fromJson(json.decode(response.body));
//               }else{
//                   throw Exception('Failed to load post');
//               }
//             }

//             class Post{
//               final String base64;
              
//               Post({this.base64});

//               factory Post.fromJson(Map<String , dynamic>json){
//                 return Post(
//                     base64: json['base64'],

//                 );
//               }
//             }

