import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:railwayflutterapp/generateQRcode.dart';
import 'package:railwayflutterapp/scanQRcode.dart';

class QRCodePage extends StatefulWidget{
  static String tag = 'qrCodePage';
   _QRCodePageState createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage>{

   Widget build(BuildContext context){
     return Scaffold(
       appBar: AppBar(
         title: Text(""),
         centerTitle: true,
       ),

       body: Container(
         padding: EdgeInsets.all(50.0),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: <Widget>[
             Image(image: NetworkImage("https://media.istockphoto.com/vectors/qr-code-scan-phone-icon-in-comic-style-scanner-in-smartphone-vector-vector-id1166145556")),
             flatButton("Scan the QR code", ScanQRCode()),
             SizedBox(height: 10.0),
             flatButton("Generate QR code", GenerateQRcode()),
           ],
         ),
       ),

     );
   }

   Widget flatButton(String text, Widget widget){
     return FlatButton(
       padding: EdgeInsets.all(15.0),
       child: Text(text),
       onPressed: (){
         Navigator.of(context).push(MaterialPageRoute(builder: (context)=> widget));
       },
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(20.0),
             side: BorderSide(color: Colors.blueAccent, width: 3.0)
       ),
     );
   }
}