import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; //transfer data between client and server in json form
import 'package:railwayflutterapp/home.dart';
import 'registerUser.dart';
import 'home_page.dart';
import 'dart:io';


String message;

class loginPage extends StatefulWidget{

   static String tag = "loginPage";
  _LoginPageState createState()=> new _LoginPageState();
}

class _LoginPageState extends State<loginPage>{

  //provide intial value to the text feilds
  TextEditingController Email = new TextEditingController();
  TextEditingController  pass = new TextEditingController();


  login(String email,String password) async {
    Map data = {
      "Email": email,
      "pass": password,
    };
     var jsonData = null;
    final response = await http.post("http://127.0.0.1/RailwayAPI/railwayAPI.php/loginDetails", body: data);
    if(response.statusCode == 200){
      jsonData = json.decode(response.body);
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => HomePage()), (Route<dynamic>route) => false);

      });
    }
    else{
      print(response.body);
    }
    /*var datauser = json.decode(response.body);
    if(datauser.length==0){
      setState(() {
        message = "Login Fail";
      });
    }else{
      message = "Successfully login";
    }*/
  }

  Widget build(BuildContext context){

    final logo = Hero(
      tag: 'Hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 28.0,
        child:Image.asset('assets/loginImage.png'),
      ),
    );

    //Can't change the value in final keyword
    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      //initialValue: 'dilki@gmial.com',
      controller: Email,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0)
        ),

      ),
    );

    final password = TextFormField(
      autofocus: false,
      //initialValue: 'password',
      obscureText: true,//hide the text been edited
      controller: pass,
      decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0)
          ),

      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
         borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: (){
            //login(Email.text ,pass.text);
             Navigator.of(context).pushNamed(Home.tag);
            // _login();
          },
          color: Colors.lightBlueAccent,
          child: Text('Login',style: TextStyle(color: Colors.white),


          ),
        ),


      ),
    );

    final fogotPassword = FlatButton(
      child: Text('Forgot password', style: TextStyle(color: Colors.black54),),
      onPressed: (){
        //Navigator.of(context).pushNamed(registerUser.tag);
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0,right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0,),
            email,
            SizedBox(height: 8.0,),
            password,
            SizedBox(height: 24.0,),
            loginButton,
            fogotPassword
          ],
        ),
      ),
    );
    return new Container();
  }
}