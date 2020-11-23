//import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:railwayflutterapp/home_page.dart';
import 'package:railwayflutterapp/login2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class Home extends StatefulWidget{
  static String tag = 'home';

  _HomeState createState()=> _HomeState();
}
class _HomeState extends State<Home>{

  String videoURL = "https://www.youtube.com/watch?v=ir0rOarctpo&ab_channel=CEYLONTRAINS";

  YoutubePlayerController _controller;

  @override
  void initState() {

    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL)
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(101, 101, 101, 101),
      appBar: AppBar(
        title: Text("Railway Management System"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height:20),

              Text(
                "The railway Management system facilitates the passengers to enquire about the trains available on the basis of source and destination, booking and cancellation of tickets, enquire about the status of the booked ticket, etc.",
                style: TextStyle(fontSize: 18.0,color: Colors.lightBlue, fontStyle: FontStyle.italic),

              ),
              SizedBox(height:20),

              YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
              ),
              SizedBox(height:20),

             RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                    borderRadius: BorderRadius.circular(30.0),
                    shadowColor: Colors.lightBlueAccent.shade100,
                    elevation: 5.0,
                    child: MaterialButton(
                        minWidth: 200.0,
                        height: 42.0,
                        onPressed: (){
                        Navigator.of(context).pushNamed(HomePage.tag);
                        },
                        color: Colors.lightBlueAccent,
                        child: Text('Next',style: TextStyle(color: Colors.white),


                ),
                    ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}























