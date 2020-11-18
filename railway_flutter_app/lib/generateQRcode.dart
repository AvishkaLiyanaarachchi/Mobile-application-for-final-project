import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQRcode extends StatefulWidget{

    _GenerateQRcodeState createState() => _GenerateQRcodeState();
}

class _GenerateQRcodeState extends State<GenerateQRcode>{

   //String qrData = "https://github.com/neon97";
   String qrData = "https://github.com/AvishkaLiyanaarachchi";
   Widget build(BuildContext context){
     return Scaffold(
       appBar: AppBar(
         title: Text("Generate"),
         actions: <Widget> [],
       ),
       body: Container(
          padding: EdgeInsets.all(20.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
              QrImage(data: qrData),
             SizedBox(height: 40.0,),
             Text("Get the data/link to the QR code"),
             TextField(
               controller: qrText,
               decoration: InputDecoration(
                 hintText: "Enter data",
               ),
             ),
           SizedBox(height: 20.0),
           FlatButton(
             padding: EdgeInsets.all(15.0),
             child: Text("Generate QR code"),
             onPressed: () async {
               if(qrText.text.isEmpty){

                 setState(() {
                   qrData = "";
                 });
               }else{
                  setState(() {
                    qrData = qrText.text;
                  });
               }
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

   final qrText = TextEditingController();
}