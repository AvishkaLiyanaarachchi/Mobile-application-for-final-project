import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:railwaystationmasterflutter/timeTableDetails.dart';


class ManageTimetable extends StatefulWidget{

  ManageTimetableState createState() => ManageTimetableState();
}
class ManageTimetableState extends State{

  TextEditingController timeTable_id = new TextEditingController();
  TextEditingController trainDes = new TextEditingController();
  TextEditingController trainType = new TextEditingController();
  TextEditingController arrivalTime = new TextEditingController();
  TextEditingController departureTime = new TextEditingController();

  bool visible = false;  // Boolean variable for CircularProgressIndicator.

  Future insert_timetable_data()async {
    // Showing CircularProgressIndicator using State
    setState(() {
      visible = true;
    });
    // Store all data with Param Name
    var data = {'trainDes' : trainDes.text,'trainType' :  trainType.text, 'arrivalTime' : arrivalTime.text, 'departureTime' :departureTime.text};
    // Starting Web Call with data
    final response = await http.post("http://10.0.2.2:80/RailwayAPI/railwayAPI.php/inserttimeTable", body: json.encode(data));
    // Getting Server response into variable
    var datauser = jsonDecode(response.body);
    print(datauser);

    // If Web call Success than Hide the CircularProgressIndicator
    if(response.statusCode == 200){
      setState(() {
        visible = false;
      });

      // Showing Alert Dialog with Response JSON
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Successfully inserted records"),
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

    }else {
      print(response.body);
    }

  }

  Future updatedata()async {
    // Showing CircularProgressIndicator using State
    setState(() {
      visible = true;
    });
    // Store all data with Param Name
    var data = {'timeTable_id' :timeTable_id.text, 'trainDes' :trainDes.text, 'trainType' : trainType.text, 'arrivalTime' : arrivalTime.text, 'departureTime' : departureTime.text};
    // Starting Web Call with data
    final response = await http.put("http://10.0.2.2:80/RailwayAPI/railwayAPI.php/updateTimetable", body: json.encode(data));
    // Getting Server response into variable
    var datauser = jsonDecode(response.body);
    print(datauser);
    // If Web call Success than Hide the CircularProgressIndicator
    if(response.statusCode == 200){
      setState(() {
        visible = false;
      });

      // Showing Alert Dialog with Response JSON
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Successfully updated records"),
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
      //print(datauser);
      //print(response.statusCode);
      //json.decode(response.body);
    }else {
      print(response.body);
    }




  }

  Future delete_timetable_data()async {
    // Showing CircularProgressIndicator using State
    setState(() {
      visible = true;
    });
    // Store all data with Param Name
    var data = {'timeTable_id.text' :timeTable_id.text};
    // Starting Web Call with data
    final response = await http.delete("http://10.0.2.2:80/RailwayAPI/railwayAPI.php/deleteTime");
    // Getting Server response into variable
    var datauser = jsonDecode(response.body);
    // If Web call Success than Hide the CircularProgressIndicator
    if(response.statusCode == 200){
      setState(() {
        visible = false;
      });

      print(response.statusCode);
      json.decode(response.body);
    }else {
      print(response.body);
    }

    // Showing Alert Dialog with Response JSON
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Successfully deleted records"),
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

  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.red, Colors.amber, Colors.green, Colors.blue])
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height:20),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'TRAIN SCHEDUAL',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: Colors.purpleAccent),
                ),
              ),
              Divider(),
              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: timeTable_id,
                    autocorrect: true,
                    decoration: InputDecoration(hintText: 'Enter time table ID '),
                  )
              ),
              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: trainDes,
                    autocorrect: true,
                    decoration: InputDecoration(hintText: 'Enter train destination '),
                  )
              ),
              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: trainType,
                    autocorrect: true,
                    decoration: InputDecoration(
                        hintText: 'Enter train type '),
                  )
              ),
              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: arrivalTime,
                    autocorrect: true,
                    decoration: InputDecoration(hintText: 'Enter train arrival time  '),
                  )
              ),
              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller:  departureTime,
                    autocorrect: true,
                    decoration: InputDecoration(hintText: 'Enter train departure time '),
                  )
              ),
             SizedBox(height: 40.0),
              Wrap(
                children: <Widget>[
                  RaisedButton(
                    onPressed: insert_timetable_data,
                    color: Colors.purple,
                    textColor: Colors.white,
                    child: Text('Add time table'),

                  ),
                  SizedBox(width: 20),
                  RaisedButton(
                    onPressed: updatedata,
                    color: Colors.purple,
                    textColor: Colors.white,
                    child: Text('Update time table'),

                  ),
                  RaisedButton(
                    onPressed: delete_timetable_data,
                    color: Colors.purple,
                    textColor: Colors.white,
                    child: Text('Delete time table'),

                  ),
                  SizedBox(width: 20),
                  RaisedButton(
                    onPressed: (){
                      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new TimeTableDetails()));
                    },
                    color: Colors.purple,
                    textColor: Colors.white,
                    child: Text('Fetch timetable'),

                  ),
                ],
              ),
              Visibility(
                  visible: visible,
                  child: Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: CircularProgressIndicator()
                  )
              ),

            ],
          ),
        ),
      ),
    );

  }
}