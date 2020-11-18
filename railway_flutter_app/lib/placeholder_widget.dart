//import 'dart:html';
import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:core';
import 'trainDetail_api.dart';
import 'TrainDetail.dart';
import 'trainDetails2.dart';
import 'dart:developer' as developer;

class PlaceHolderWidget extends StatelessWidget{

  /*final Color color;

  PlaceHolderWidget(this.color);

  Widget build(BuildContext context){
    return Container(
      color: color,
    );
  }*/

  //final ListView listView;
  //PlaceHolderWidget(this.listView);

  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Train Details"),
        ),
        body: MainListView(),//call the MainListView class
      ),
    );

  }

}

class MainListView extends StatefulWidget{

  MainListViewState createState() => MainListViewState();//pass the child MainListViewState class

}
//Inside the class display the item into listview
class MainListViewState extends State{

  //User clicks on the listview item it would automatically navigate to next activity and send selected item ID along with it
  naviagteToNextActivity(BuildContext context, int dataHolder){

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SecondScreenState(dataHolder.toString())
      )
    );
  }
  //make the future builder widget and return the listview widget
  Widget build(BuildContext context) {
    return FutureBuilder<List<Traindetail>>(
      future: fetchTrainDetails(),
      builder: (context, snapshot) {
      if (!snapshot.hasData) return Center(
            child: CircularProgressIndicator()//This widget used to while data is loading from server as loader
        );

        return ListView(
            children: snapshot.data
            .map((data) => Column(children: <Widget>[
              GestureDetector(
                onTap: () {
                  naviagteToNextActivity(context, data.trainId);
                },
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Padding(
                          padding: EdgeInsets.fromLTRB(20, 5, 0, 5),
                          child: Text(data.trainName,
                              style: TextStyle(fontSize: 21),
                              textAlign: TextAlign.left))
                    ]),),

              Divider(color: Colors.black),
            ],))

        .toList(),

        );
      },
    );
  }

}
//Inside the class first receive the send ID from previous activity and pass the second screen class name along with it
class SecondScreenState extends StatefulWidget {

  final String idHolder;
  SecondScreenState(this.idHolder);
  @override
  State<StatefulWidget> createState() {
    return SecondScreen(this.idHolder);
  }
}
//Inside the clas display selected listview item record
class SecondScreen extends State<SecondScreenState>{

  final String idHolder ;
  SecondScreen(this.idHolder);//store the selected item ID in idHolder variable

  var url = "http://10.0.2.2:80/RailwayAPI/railwayAPI.php/trainID";
  //Inside the function call the API qurl and make the POST method and send ID to server and in return server record based on ID
  Future<List<trainDetail2>> TrainDetails()async{

    /*var url = "http://10.0.2.2:80/RailwayAPI/railwayAPI.php/trainDetailID/?id="+idHolder;
    var data = {'trainId': int.parse(idHolder)};
    var response = await http.get(url);
    developer.log(response.body);
    //return traindetailFromMap(response.body);
    final items = json.decode(response.body).cast<Map<String, dynamic>>();

    List<TrainDetail2> trainList = items.map<TrainDetail2 >((json) {
      return TrainDetail2.fromJson(json);
    }).toList();

    return trainList;*/
    var data = {'trainId': int.parse(idHolder)};
    var response = await http.post(url, body: json.encode(data));
    developer.log(response.body);
    if (response.statusCode == 200) {

      print(response.statusCode);

      final items = json.decode(response.body).Map<String, dynamic>();

      List<trainDetail2> trainList = items.map<trainDetail2>((json) {
        return trainDetail2.fromJson(json);
      }).toList();

      return trainList;
    }
    else {
      print('Failed to load data from Server.');
    }


  }

  //make future builder widget with listview return
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                title: Text('Showing Selected train Details'),
                automaticallyImplyLeading: true,
                leading: IconButton(icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context, false),
                )
            ),
            body: FutureBuilder<List<trainDetail2>>(
              future: TrainDetails(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Center(
                    child: CircularProgressIndicator()//data loading
                );

                return ListView(
                  children: snapshot.data
                      .map((data) =>
                      Column(children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            print(data.trainName);
                          },
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Padding(
                                    padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                                    child: Text(
                                        'id = ' + data.trainId.toString(),
                                        style: TextStyle(fontSize: 21))),

                                Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: Text('name = ' + data.trainName,
                                        style: TextStyle(fontSize: 21))),

                                Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: Text('number = ' + data.trainNumber,

                                        style: TextStyle(fontSize: 21))),

                                Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: Text(
                                        'destination = ' + data.destination,
                                        style: TextStyle(fontSize: 21))),

                                Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: Text('timeTableId = ' + data.tblTimeTableTimeTableId.toString(),
                                        style: TextStyle(fontSize: 21))),

                                Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: Text(
                                        'seat = ' + data.availabilitySeat,
                                        style: TextStyle(fontSize: 21))),

                                Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: Text(
                                        'class_type = ' + data.classType,
                                        style: TextStyle(fontSize: 21))),
                              ]),)
                      ],))
                      .toList(),
                );
              },
            )
        ));
  }
}