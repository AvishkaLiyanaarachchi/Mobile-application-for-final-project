import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:railwaystationmasterflutter/fetchTrains.dart';
import 'manageTimeTable.dart';

class HomePage extends StatelessWidget{

  final String title = "Railway Management System";
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: AppBar(title: Text(title)),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile  (
              title: Text('Train Details'),
              onTap: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context)=> new FetchTrains()));
              },
            ),
            ListTile(
              title: Text('Train Timetable'),
              onTap: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context)=> new ManageTimetable()));
              },
            ),

          ],
        ),
      ),
    );
  }
}