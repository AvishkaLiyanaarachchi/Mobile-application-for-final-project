import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:railwayflutterapp/options.dart';

class TicketBooking extends StatefulWidget{

  TicketBooking({Key key, this.title}) : super(key:key);
  final String title;

  _TicketBookingState createState() => _TicketBookingState();
}

class _TicketBookingState extends State<TicketBooking>{

  DateTime selectedDate = DateTime.now();

  Future<Null> _selectedDate(BuildContext context) async{
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015,8),
        lastDate: DateTime(2101));
    if(picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

   Widget build(BuildContext context){
     return Scaffold(
       backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
       appBar: AppBar(
         title: Text(
           "Train Ticket Booking"
         ),
         centerTitle: true,
       ),
       body: Center(
         child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                 begin: Alignment.topRight,
                 end: Alignment.bottomLeft,
                 colors: [Colors.blue, Colors.red])),
           child: Column(
             mainAxisSize:  MainAxisSize.min,
             children: <Widget>[
               Text("${selectedDate.toLocal()}".split('')[0]),
               SizedBox(height: 20.0,),
               RaisedButton(
                 onPressed: () => _selectedDate(context),
                 child: Text('Select date',style: TextStyle(
                     fontSize: 28.0,
                     fontWeight: FontWeight.bold,
                     color: Colors.white)),
               ),
               Container(
                   width: 280,
                   padding: EdgeInsets.all(10.0),
                   child: TextField(
                     decoration: InputDecoration(hintText: 'From ',  hintStyle: TextStyle(fontSize: 18),),
                   )
               ),
               Container(
                   width: 280,
                   padding: EdgeInsets.all(10.0),
                   child: TextField(
                     decoration: InputDecoration(hintText: 'To ',hintStyle: TextStyle(fontSize: 18),),
                   )
               ),
               Container(
                   width: 280,
                   padding: EdgeInsets.all(10.0),
                   child: TextField(
                     decoration: InputDecoration(hintText: 'No Adults ', hintStyle: TextStyle(fontSize: 18),),
                   )
               ),
               Container(
                   width: 280,
                   padding: EdgeInsets.all(10.0),
                   child: TextField(
                     decoration: InputDecoration(hintText: 'No childs ', hintStyle: TextStyle(fontSize: 18),),
                   )
               ),
             /*InkWell(
               onTap: (){
                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => Options()));
               },
               child: Text('Ticket booking',
                 style: TextStyle(
                   color:Color(0xFF1287A5),
                 ),
               ),
             ),*/
             RaisedButton(
               padding: const EdgeInsets.all(8.0),
               textColor: Colors.white,
               color: Colors.blue,
               //color: Colors.red,
               child: Text('Ticket booking'),
               onPressed: () {
                 //Use`Navigator` widget to push the second screen to out stack of screens
                 Navigator.of(context)
                     .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                   return new Options();
                 }));
               },
             ),
             RaisedButton(
               textColor: Colors.white,
               color: Colors.red,
               padding: const EdgeInsets.all(8.0),
               child: Text('View purchased ticket'),
               onPressed: (){},

             ),


           ],
         ),
       ),
       ),
     );

   }
}