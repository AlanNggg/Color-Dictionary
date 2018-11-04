import 'dart:async';
import 'package:barcode_scan/barcode_scan.dart';

//import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScanScreen extends StatefulWidget{
    @override
    _ScanState createState() => _ScanState();

}

class _ScanState extends State<ScanScreen>{
  String result = "HIIIII";
  Future _scanQR() async{
    try{
      String qrResult = await BarcodeScanner.scan();
      setState(() {
              result = qrResult;
            });
    }on PlatformException catch(e){
      if(e.code == BarcodeScanner.CameraAccessDenied){
        setState(() {
                //result = 'Camera permission was denied';
                _showDialog(context);
                });
        
      }else{
          setState(() {
                    result = "Unknow Error in BarCode Scanner $e";
                    });
      }
    }on FormatException{
      setState((){
          //result = 'You pressed the back button before scanning anything';
      });
    }catch(e){
       setState(() {
                    result = "Unknow Error $e";
                    });
    } 
  }

  @override
  void initState() {
      // TODO: implement initState
      super.initState();
    }
    @override
    Widget build(BuildContext context){
      return Scaffold(
          appBar: new AppBar(title:new Text("QR Scanner")),
          body: new Center(
                child: Text(
                result,
                 style: new TextStyle(fontSize:30.0 , fontWeight:FontWeight.bold), 
                ),  
          ),
          floatingActionButton:new FloatingActionButton.extended(
            icon:Icon(Icons.camera),
            label:Text('Scan'),
            onPressed:_scanQR,
          )
      );
    }
}

void _showDialog(BuildContext context){
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

//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//           appBar: new AppBar(
//             title: new Text('QR Code'),
//           ),
//           body: new Center(
//             child:new Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 Padding(
//                   padding:EdgeInsets.symmetric(horizontal:16.0 , vertical: 8.0),
//                   child:RaisedButton(
//                     color: Colors.blue,
//                     textColor: Colors.white,
//                     splashColor: Colors.blueGrey,
//                     onPressed: scan,
//                     child: const Text('Start camera scan'),
//                   ),
//                 ),
//                 Padding(
//                   padding:EdgeInsets.symmetric(horizontal:16.0,vertical:8.0),
//                   child:Text(barcode , textAlign: TextAlign.center,),
//                   )
//               ],
//             )
//           ),     
//     );
//   }

//   Future scan() async{
//     try{
//        String barcode = await BarcodeScanner.scan();
//        setState(() => this.barcode = barcode);
//     } on PlatformException catch(e){
//           if(e.code == BarcodeScanner.CameraAccessDenied){
//             setState(() {
//                           this.barcode = "The user did not grant the camera permission!";
//                         });
//           }else{
//             setState(() => this.barcode = 'Unknown error: $e');
//           } 
//     } on FormatException{
//           setState(() => this.barcode = 'null');
//     } catch(e){
//      setState(() => this.barcode = "Unknow error: $e");
//     }
//   }
// }