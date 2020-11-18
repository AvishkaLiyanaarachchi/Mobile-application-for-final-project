import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:railwayflutterapp/qrCodePage.dart';

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

   String bank_name;
   List<String> bank = [
     "People's bank",
     "Commercial bank",
     "NSB bank",
     "DFC bank",
     "HFCC"
   ];

   Widget build(BuildContext context){
     return Scaffold(
       appBar: AppBar(
         title: Text("Payment details"),
       ),
       body: Container(
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
               hintText: 'Payment options',
               labelText: 'Payment',
               items: payment,
             ),
             SizedBox(height: 20),
             TextFormField(
               cursorColor: Colors.teal,
               decoration: InputDecoration(
                 prefixIcon: Icon(Icons.credit_card, color: Color(0xFF1287A5),),
                 hintText: 'Enter card number',
                 border: OutlineInputBorder(),
               ),
             ),
             SizedBox(height: 20),
             DropDownField(
               onValueChanged: (dynamic value){
                 bank_name = value;
               },
               value: bank_name,
               required: false,
               hintText: 'Bank names',
               labelText: 'Banks',
               items: bank,
             ),
             SizedBox(height: 40),
             RaisedButton(
               color: Colors.red,
               child: Text('Pay'),
               onPressed: () {
                 //Use`Navigator` widget to push the second screen to out stack of screens
                 Navigator.of(context)
                     .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                   return new QRCodePage();
                 }));
               },
             ),
           ],
         ),
       ),
     );
   }
}