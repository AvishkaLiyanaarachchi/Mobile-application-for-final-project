import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:railwayflutterapp/timeTable.dart';
import 'package:railwayflutterapp/timeTable_api.dart';
//import 'dart:developer' as developer;

class TimeTableNavbar extends StatelessWidget{

  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(title: Text('Time Table'),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: FutureBuilder(
            future: fetchTimetable(),

            builder: (context, snapshot){
              //developer.log('@@@@@@@@@@@@@'+snapshot.hasData.toString());
              if(snapshot.hasData){

                 return ListView.builder(
                   itemCount: snapshot.data.length,
                   shrinkWrap: true,
                   itemBuilder: (BuildContext context, index){
                     Timetable timetable = snapshot.data[index];
                     return Card(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           Text(
                               '${timetable.destination}',
                             style: TextStyle(fontSize: 25, color: Colors.indigoAccent),
                           ),
                           Center(
                             child: Text(
                               '${'Train type:  '+timetable.trainType}',
                               style: TextStyle(fontSize: 15, color: Colors.lightBlueAccent,),
                             ),
                           ),
                           Center(
                             child: Text(
                               '${'Arrival time:  '+timetable.arrivalTime}',
                               style: TextStyle(fontSize: 15, color: Colors.lightBlueAccent),
                             ),
                           ),
                           Center(
                             child: Text(
                               '${'Depature time:  '+timetable.depatureTime}',
                               style: TextStyle(fontSize: 15, color: Colors.lightBlueAccent),
                             ),
                           ),
                         ],
                       ),
                     );

                   },
                 );
              }else{
                //developer.log('################# else');
              }

              return CircularProgressIndicator();
            }
          ),
        ),
      )
    );
  }
}