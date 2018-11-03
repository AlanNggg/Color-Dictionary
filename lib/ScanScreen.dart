import 'dart:async';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScanScreen extends StatefulWidget{
    @override
    _ScanState createState() => _ScanState();

}

class _ScanState extends State<ScanScreen>{
  String barcode = "";

  @override
  void initState() {
      // TODO: implement initState
      super.initState();
    }

  @override
  Widget build(BuildContext context){
    return Scaffold(
          appBar: new AppBar(
            title: new Text('QR Code'),
          ),
          body: new Center(
            child:new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding:EdgeInsets.symmetric(horizontal:16.0 , vertical: 8.0),
                  child:RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    splashColor: Colors.blueGrey,
                    onPressed: scan,
                    child: const Text('Start camera scan'),
                  ),
                ),
                Padding(
                  padding:EdgeInsets.symmetric(horizontal:16.0,vertical:8.0),
                  child:Text(barcode , textAlign: TextAlign.center,),
                  )
              ],
            )
          ),     
    );
  }

  Future scan() async{
    try{
       String barcode = await BarcodeScanner.scan();
       setState(() => this.barcode = barcode);
    } on PlatformException catch(e){
          if(e.code == BarcodeScanner.CameraAccessDenied){
            setState(() {
                          this.barcode = "The user did not grant the camera permission!";
                        });
          }else{
            setState(() => this.barcode = 'Unknown error: $e');
          } 
    } on FormatException{
          setState(() => this.barcode = 'null');
    } catch(e){
     setState(() => this.barcode = "Unknow error: $e");
    }
  }
}