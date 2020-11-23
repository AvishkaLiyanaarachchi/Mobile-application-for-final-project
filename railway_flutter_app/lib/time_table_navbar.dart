import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:railwayflutterapp/timeTable.dart';
import 'package:railwayflutterapp/timeTable_api.dart';
//import 'dart:developer' as developer;
import 'dart:convert';
import 'package:http/http.dart' as http;

/*class TimeTableNavbar extends StatelessWidget{

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
}*/

class TimeTableNavbar extends StatefulWidget{

  TimetableState createState() => TimetableState();//pass the child MainListViewState class

}

class TimetableState extends State {
  //User clicks on the listview item it would automatically navigate to next activity and send selected item ID along with it
  naviagteTimeTableDetailsActivity(BuildContext context, int dataHolder) {
    Navigator.of(context).push(

        MaterialPageRoute(
            builder: (context) => TimeTableState (dataHolder.toString())
        )
    );
  }

  bool _debugLocked = false; // used to prevent re-entrant calls to push, pop, and friends

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
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  naviagteTimeTableDetailsActivity(context,timetable.timeTableId)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                          width: 55.0,
                                          height: 55.0,
                                          //color: Colors.green,
                                          child: CircleAvatar(
                                            //backgroundColor: Colors.green,
                                            //foregroundColor: Colors.green,
                                            //backgroundImage: NetworkImage("https://www.google.com/imgres?imgurl=https%3A%2F%2Fimages.pexels.com%2Fphotos%2F1793503%2Fpexels-photo-1793503.jpeg%3Fauto%3Dcompress%26cs%3Dtinysrgb%26dpr%3D1%26w%3D500&imgrefurl=https%3A%2F%2Fwww.pexels.com%2Fsearch%2Ftrain%2F&tbnid=VaEgr8p1j28xFM&vet=12ahUKEwjwuLaKtZTtAhV08eAKHQ6sCEgQMygGegUIARDdAQ..i&docid=HzvKZF54sNY68M&w=500&h=333&q=train%20images&ved=2ahUKEwjwuLaKtZTtAhV08eAKHQ6sCEgQMygGegUIARDdAQ"),
                                            child: Image(image: AssetImage('assets/img1.jpg')),
                                          )
                                      ),
                                    ],

                                ),
                                Container(
                                  alignment: Alignment.topRight,
                                  //padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                                  child: FlatButton(
                                    onPressed: (){},
                                    color: Colors.red[200],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Text("search",style: TextStyle(color: Colors.white)),
                                  ),
                                ),
                                /*Text(
                                  '${timetable.destination}',
                                  style: TextStyle(fontSize: 25, color: Colors.indigoAccent),
                                ),*/
                                Center(
                                  child: Text(
                                    '${timetable.destination}',
                                    style: TextStyle(fontSize: 25, color: Colors.indigoAccent),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    '${'Train type:  '+timetable.trainType}',
                                    style: TextStyle(fontSize: 18, color: Colors.lightBlueAccent,),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    '${'Arrival time:  '+timetable.arrivalTime}',
                                    style: TextStyle(fontSize: 18, color: Colors.lightBlueAccent),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    '${'Depature time:  '+timetable.depatureTime}',
                                    style: TextStyle(fontSize: 18, color: Colors.lightBlueAccent),
                                  ),
                                ),

                              ],
                            ),
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
//Inside the class first receive the send ID from previous activity and pass the second screen class name along with it
class TimeTableState extends StatefulWidget {

  final String idHolder;
  TimeTableState (this.idHolder);
  @override
  State<StatefulWidget> createState() {
    return TimetableScreen(this.idHolder);
  }
}

//Inside the clas display selected listview item record
class TimetableScreen extends State<TimeTableState >{

  final String idHolder ;
  TimetableScreen(this.idHolder);//store the selected item ID in idHolder variable

  var url = "http://10.0.2.2:80/RailwayAPI/timeTable.php";

  //Inside the function call the API qurl and make the POST method and send ID to server and in return server record based on ID
  Future<List<Timetable>> timeTableDetails()async{

    var data = {'timeTableId': int.parse(idHolder)};
    var response = await http.post(url, body: json.encode(data));
    //developer.log(response.body);
    //print(data);
    if (response.statusCode == 200) {


      final items = json.decode(response.body).cast<Map<String, dynamic>>();
      print(items);

      List<Timetable> timeList = items.map<Timetable>((json) {
        return Timetable.fromMap(json);
      }).toList();
      print(timeList);
      return timeList;
    }
    else {
      throw Exception('Failed to load data from Server.');
    }

  }

  //make future builder widget with listview return
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                title: Text('Showing Selected time table Details'),
                automaticallyImplyLeading: true,
                leading: IconButton(icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context, false),
                )
            ),
            body: FutureBuilder<List<Timetable>>(
              future: timeTableDetails(),
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
                            print(data.destination);
                          },
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                                    child: Text(
                                        'Id = ' + data.timeTableId.toString(),
                                        style: TextStyle(fontSize: 21))),

                                Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: Text('Destination = ' + data.destination,
                                        style: TextStyle(fontSize: 21))),

                                Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: Text('Train type = ' + data.trainType,

                                        style: TextStyle(fontSize: 21))),

                                Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: Text(
                                        'Arrival time = ' + data.arrivalTime,
                                        style: TextStyle(fontSize: 21))),

                                Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: Text('Departure time = ' + data.depatureTime.toString(),
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



