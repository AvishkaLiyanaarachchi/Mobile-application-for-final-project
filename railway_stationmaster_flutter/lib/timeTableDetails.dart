import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:railwaystationmasterflutter/model/timeTable.dart';
import 'package:railwaystationmasterflutter/controller/timeTable_API.dart';

class TimeTableDetails extends StatelessWidget{

  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
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

