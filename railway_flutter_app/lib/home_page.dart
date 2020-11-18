import 'package:flutter/material.dart';
import 'package:railwayflutterapp/TrainDetail.dart';
import 'package:railwayflutterapp/options.dart';
import 'package:railwayflutterapp/placeholder_widget.dart';
import 'package:railwayflutterapp/ticket_booking.dart';
import 'package:railwayflutterapp/time_table_navbar.dart';
import 'Screens/ticket-purchasing.dart';

class HomePage extends StatefulWidget{

  State<StatefulWidget> createState(){
    return _NavigationPageState();
  }

  static String tag = 'home-page';

}

class _NavigationPageState extends State<HomePage>{

  static String tag = 'navigationPageState';

  int _currentIndex = 0;
  final List<Widget> _children = [

    PlaceHolderWidget(),
    TimeTableNavbar(),
    TicketBooking(),
    //Options(),
    //PlaceHolderWidget(),
    //PlaceHolderWidget(Colors.greenAccent),
    //PlaceHolderWidget(Colors.deepOrangeAccent),
  ];

  Widget build(BuildContext context){

    return MaterialApp(
      home: Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            new BottomNavigationBarItem(icon: Icon(Icons.train),
              title: Text('Train details'),
            ),
            new BottomNavigationBarItem(icon: Icon(Icons.timer),
              title: Text('Time Table'),
            ),
            new BottomNavigationBarItem(icon: Icon(Icons.phone_iphone),
              title: Text('Ticket Purchasing'),
            ),
          ],
        ),
      ),


    );
  }

  void onTabTapped(int index){

    setState(() {
      _currentIndex = index;
    });

  }


}