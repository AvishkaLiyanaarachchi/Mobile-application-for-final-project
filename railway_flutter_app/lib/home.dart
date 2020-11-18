//import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:railwayflutterapp/home_page.dart';
import 'package:railwayflutterapp/login2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class Home extends StatefulWidget{
  static String tag = 'home';
  _HomeState createState()=> _HomeState();
}
class _HomeState extends State<Home>{



  /*SharedPreferences sharedPreferences;
  void initState(){
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async{
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") == null){
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => Login()),(Route<dynamic> route) => false);
    }
  }*/



        /*FlutterYoutube.playYoutubeVideoByUrl(
            apiKey: "AIzaSyALKG2R6jADrrUDU3BPoBNtZxiMNMETov0",
            videoUrl: "https://www.youtube.com/watch?v=9y3muHwCZxw&ab_channel=GopiRailworld",
        );*/






  Widget build(BuildContext context){

       /*final home = Hero(
        tag: 'hero',
          child: Padding(
             padding: EdgeInsets.all(16.0), child: CircleAvatar(
            radius: 72.0,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('assets/loginImage.png'),
          ),
        )
       );*/

        final welcome = Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            'Welcome Homepage',
            style: TextStyle(fontSize: 28.0,color: Colors.white),
          ),
        );

        final lorem = Padding(
          padding: EdgeInsets.all(28.0),
          child: Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
            style: TextStyle(fontSize: 16.0,color: Colors.white),
          ),
        );

        final nextButton = Padding(
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
        );

        final body = Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(28.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors:[
              Colors.lightBlueAccent,
              Colors.lightBlueAccent
            ]),
          ),
          child: Column(
            children: <Widget>[
              welcome,lorem,nextButton
            ],
          ),
        );

        return Scaffold(
          body: body,
        );
  }
}