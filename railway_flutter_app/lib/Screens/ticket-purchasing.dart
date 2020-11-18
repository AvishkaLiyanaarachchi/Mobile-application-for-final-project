import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:railwayflutterapp/boxDestination.dart';
import 'package:railwayflutterapp/options.dart';
import 'package:railwayflutterapp/recommendation.dart';
import 'package:railwayflutterapp/selectOptions.dart';
import 'package:railwayflutterapp/selectWay.dart';

class TicketPurchasing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dropdowns",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Options(),
    );
  }
}



/*class TicketPurchasing extends StatefulWidget{

  _TicketPurchasingState createState() => _TicketPurchasingState();
}

class _TicketPurchasingState extends State<TicketPurchasing>{

   Widget build(BuildContext context){
     return Scaffold(
       backgroundColor: Colors.white,
       body: SingleChildScrollView(
         child: SafeArea(
           child: Container(
             //margin: EdgeInsets.only(left: 30, top: 40, bottom: 60),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                  Options(),
                 //SizedBox(height: 40),
                 //BoxDestination(),
                 //SizedBox(height: 22),
                 //SelectWay(),
                 //SizedBox(height: 25),
                 //SelectOptions(),
                 //SizedBox(height: 16),
                 Recommendation()
               ],
             ),
           ),
         ),
       ),
     );
   }
}*/