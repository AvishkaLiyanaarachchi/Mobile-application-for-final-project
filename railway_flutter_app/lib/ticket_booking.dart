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
       appBar: AppBar(
         title: Text(
           "Train Ticket Booking"
         ),
         centerTitle: true,
       ),
       body: Center(
         child: Column(
           mainAxisSize:  MainAxisSize.min,
           children: <Widget>[
             Text("${selectedDate.toLocal()}".split('')[0]),
             SizedBox(height: 20.0,),
             RaisedButton(
               onPressed: () => _selectedDate(context),
               child: Text('Select date'),
             ),
             Container(
                 width: 280,
                 padding: EdgeInsets.all(10.0),
                 child: TextField(
                   decoration: InputDecoration(hintText: 'From '),
                 )
             ),
             Container(
                 width: 280,
                 padding: EdgeInsets.all(10.0),
                 child: TextField(
                   decoration: InputDecoration(hintText: 'To '),
                 )
             ),
             Container(
                 width: 280,
                 padding: EdgeInsets.all(10.0),
                 child: TextField(
                   decoration: InputDecoration(hintText: 'No Adults '),
                 )
             ),
             Container(
                 width: 280,
                 padding: EdgeInsets.all(10.0),
                 child: TextField(
                   decoration: InputDecoration(hintText: 'No childs '),
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
               color: Colors.red,
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
               //onPressed: (),
               color: Colors.green,
               textColor: Colors.white,
               padding: EdgeInsets.fromLTRB(10,10,10,10),
               child: Text('View purchased ticket'),
             ),


           ],
         ),
       ),
     );

   }
}