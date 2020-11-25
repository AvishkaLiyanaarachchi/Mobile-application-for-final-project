import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:railwayflutterapp/qrCodePage.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Options extends StatefulWidget{
  static String tag = 'options';
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options>{

   void initState(){
     super.initState();
   }

   String payment_type;
   List<String> payment = [
     "Credit card",
     "Debit card",
     "mobile payment",
     "Paypal",
     "Visa checkout"
   ];

   String bankName;
   List<String> bank = [
     "People's bank",
     "Commercial bank",
     "NSB bank",
     "DFC bank",
     "HFCC"
   ];



   //bool visible = false;  // Boolean variable for CircularProgressIndicator.
   Future senddata()async {

     Navigator.of(context)
                     .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                   return new QRCodePage();
                 }));
     // Showing Alert Dialog with Response JSON
     showDialog(
       context: context,
       builder: (BuildContext context) {
         return AlertDialog(
           title: new Text("Successfully pay"),
           actions: <Widget>[
             FlatButton(
               child: new Text("OK"),
               onPressed: () {
                 Navigator.of(context).pop();
               },
             ),
           ],
         );
       },
     );


   }

   Widget build(BuildContext context){
     return Scaffold(
       appBar: AppBar(
         title: Text("Payment details"),
       ),
       body: Container(
         decoration: BoxDecoration(
             gradient: LinearGradient(
                 begin: Alignment.topRight,
                 end: Alignment.bottomLeft,
                 stops: [
                   0.1,
                   0.4,
                   0.6,
                   0.9
                 ],
                 colors: [
                   Colors.yellow,
                   Colors.red,
                   Colors.indigo,
                   Colors.teal
                 ])),
         padding: EdgeInsets.all(15.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: <Widget>[
             DropDownField(
               onValueChanged: (dynamic value){
                 payment_type = value;
               },
               value: payment_type,
               required: false,
               hintText: 'Payment options',hintStyle: TextStyle(color: Colors.black,fontSize: 21, fontWeight: FontWeight.bold),
               labelText: 'Payment', labelStyle: TextStyle(fontSize: 21,color: Colors.white),
               items: payment,
             ),
             SizedBox(height: 20),
             TextFormField(
               cursorColor: Colors.teal,
               decoration: InputDecoration(
                 prefixIcon: Icon(Icons.credit_card, color: Color(0xFF1287A5),),
                 hintText: 'Enter card number', hintStyle: TextStyle(color: Colors.white,fontSize: 21, fontWeight: FontWeight.bold),
                 border: OutlineInputBorder(),
               ),
             ),
             SizedBox(height: 20),
             DropDownField(
               onValueChanged: (dynamic value){
                 bankName = value;
               },
               value: bankName,
               required: false,
               hintText: 'Bank names',hintStyle: TextStyle(color: Colors.black,fontSize: 21, fontWeight: FontWeight.bold),
               labelText: 'Banks', labelStyle: TextStyle(fontSize: 21,color: Colors.white),
               items: bank,
             ),
             SizedBox(height: 40),
             RaisedButton(
               color: Colors.red,
               child: Text('Pay', style: TextStyle(color: Colors.black,fontSize: 21, fontWeight: FontWeight.bold)),
               onPressed: senddata,
                 //Use`Navigator` widget to push the second screen to out stack of screens
                 /*Navigator.of(context)
                     .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                   return new QRCodePage();
                 }));*/

             ),
           ],
         ),
       ),
     );
   }
}