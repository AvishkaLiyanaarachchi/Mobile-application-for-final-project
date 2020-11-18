import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScanQRCode extends StatefulWidget{
  _ScanQRCodeState createState() => _ScanQRCodeState();
}

class _ScanQRCodeState extends State<ScanQRCode>{

   String QRResult = "Not yet scanned";
   Widget build(BuildContext context){
     return Scaffold(
       appBar: AppBar(
         title: Text("Scan"),
         centerTitle: true,
       ),
       body: Container(
         padding: EdgeInsets.all(20.0),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: <Widget>[
             Text("Result",style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
               textAlign: TextAlign.center,
             ),
             Text(QRResult,textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0),
             ),
             SizedBox(height: 20.0,
             ),

            FlatButton(
              padding: EdgeInsets.all(15.0),
              child: Text("Scan QR code"),
              onPressed: () async{

                String scanning = await BarcodeScanner.scan();
                setState(() {
                    QRResult = scanning;
                });
                },
               shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(20.0),
                   side: BorderSide(color: Colors.blueAccent, width: 3.0)
               ),
            )
           ],
         ),
       ),
     );
   }
}