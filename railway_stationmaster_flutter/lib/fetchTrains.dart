import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:railwaystationmasterflutter/trainDetails.dart';

class FetchTrains extends StatefulWidget{

   FetchTrainsState createState() => FetchTrainsState();
}
class FetchTrainsState extends State{

  TextEditingController trainId = new TextEditingController();
  TextEditingController trainName = new TextEditingController();
  TextEditingController trainNum = new TextEditingController();
  TextEditingController destination = new TextEditingController();
  TextEditingController timeTableID = new TextEditingController();
  TextEditingController seat = new TextEditingController();
  TextEditingController classType = new TextEditingController();

  bool visible = false;  // Boolean variable for CircularProgressIndicator.

  Future senddata()async {
    // Showing CircularProgressIndicator using State
    setState(() {
      visible = true;
    });
    // Store all data with Param Name
    var data = {'trainName' :trainName.text, 'trainNum' : trainNum.text,'destination' : destination.text, 'timeTableID' : timeTableID.text, 'seat' :seat.text, 'classType' : classType.text};
    // Starting Web Call with data
    final response = await http.post("http://10.0.2.2:80/RailwayAPI/railwayAPI.php/insertTrainDetails", body: json.encode(data));
    // Getting Server response into variable
    var datauser = jsonDecode(response.body);
    print(datauser);
    // If Web call Success than Hide the CircularProgressIndicator
    if(response.statusCode == 200){
      setState(() {
        visible = false;
      });
      //print(datauser);
      //print(response.statusCode);
      //json.decode(response.body);
    }else {
      print(response.body);
    }

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


  }

  Future updatedata()async {
    // Showing CircularProgressIndicator using State
    setState(() {
      visible = true;
    });
    // Store all data with Param Name
    var data = {'trainId' :trainId.text, 'trainName' :trainName.text, 'trainNum' : trainNum.text,'destination' : destination.text, 'timeTableID' : timeTableID.text, 'seat' :seat.text, 'classType' : classType.text};
    // Starting Web Call with data
    final response = await http.put("http://10.0.2.2:80/RailwayAPI/railwayAPI.php/updateTrain", body: json.encode(data));
    // Getting Server response into variable
    var datauser = jsonDecode(response.body);
    print(datauser);
    // If Web call Success than Hide the CircularProgressIndicator
    if(response.statusCode == 200){
      setState(() {
        visible = false;
      });
      //print(datauser);
      //print(response.statusCode);
      //json.decode(response.body);
    }else {
      print(response.body);
    }

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


  }

  Future deletedata()async {
    // Showing CircularProgressIndicator using State
    setState(() {
      visible = true;
    });
    // Store all data with Param Name
    var data = {'trainId' :trainId.text};
    // Starting Web Call with data
    final response = await http.delete("http://10.0.2.2:80/RailwayAPI/railwayAPI.php/deleteTrain");
    // Getting Server response into variable
    var datauser = jsonDecode(response.body);
    // If Web call Success than Hide the CircularProgressIndicator
    if(response.statusCode == 200){
      setState(() {
        visible = false;
      });

      //print(response.statusCode);
      //json.decode(response.body);
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
          gradient: SweepGradient(
            colors: [Colors.blue, Colors.green, Colors.yellow, Colors.red, Colors.blue],
            stops: [0.0, 0.25, 0.5, 0.75, 1],
          ),
        ),
        /*decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [ Colors.green, Colors.blue])
        ),*/
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height:20),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'TRAIN DETAILS',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: Colors.purpleAccent),
                ),
              ),
              Divider(),
              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: trainId,
                    autocorrect: true,
                    decoration: InputDecoration(hintText: 'Enter train ID '),
                  )
              ),
              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: trainName,
                    autocorrect: true,
                    decoration: InputDecoration(hintText: 'Enter train Name '),
                  )
              ),
              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: trainNum,
                    autocorrect: true,
                    decoration: InputDecoration(
                        hintText: 'Enter train number '),
                  )
              ),
              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: destination,
                    autocorrect: true,
                    obscureText: true,
                    decoration: InputDecoration(hintText: 'Enter destination  '),
                  )
              ),
              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller:  timeTableID,
                    autocorrect: true,
                    decoration: InputDecoration(hintText: 'Enter time table ID '),
                  )
              ),
              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller:  seat,
                    autocorrect: true,
                    decoration: InputDecoration(hintText: 'Enter availability seats '),
                  )
              ),
              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller:  classType,
                    autocorrect: true,
                    decoration: InputDecoration(hintText: 'Enter train class type '),
                  )
              ),
              Wrap(
                children: <Widget>[
                  RaisedButton(
                    onPressed: senddata,
                    color: Colors.purple,
                    textColor: Colors.white,
                    child: Text('Add trains'),

                  ),
                  SizedBox(width: 20),
                  RaisedButton(
                    onPressed: updatedata,
                    color: Colors.purple,
                    textColor: Colors.white,
                    child: Text('Update trains'),

                  ),
                  SizedBox(width: 20),
                  RaisedButton(
                    onPressed: deletedata,
                    color: Colors.purple,
                    textColor: Colors.white,
                    child: Text('Delete trains'),

                  ),
                  SizedBox(width: 20),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: RaisedButton(
                      onPressed: (){
                        Navigator.push(context, new MaterialPageRoute(builder: (context)=> new TrainDetails()));
                      },
                      color: Colors.purple,
                      textColor: Colors.white,
                      child: Text('Fetch trains'),

                    ),
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