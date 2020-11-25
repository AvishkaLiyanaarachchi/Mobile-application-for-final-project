import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class registerUser extends StatefulWidget{

  static String tag = 'registerUser';
  registerUserState createState() => registerUserState();

}

class registerUserState extends State{

  TextEditingController userName = new TextEditingController();
  TextEditingController emailAddress = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController contact = new TextEditingController();
  TextEditingController userAddress = new TextEditingController();
  TextEditingController userRoleId = new TextEditingController();

  bool visible = false;  // Boolean variable for CircularProgressIndicator.

  Future senddata()async {
    // Showing CircularProgressIndicator using State
    setState(() {
      visible = true;
    });
    // Store all data with Param Name
    var data = {'userName' : userName.text, 'emailAddress' : emailAddress.text,'password' : password.text, 'contact' : contact.text, 'userAddress' : userAddress.text, 'userRoleId' : userRoleId.text};
    // Starting Web Call with data
    final response = await http.post("http://10.0.2.2:80/RailwayAPI/railwayAPI.php/insertUserData", body: json.encode(data));
    // Getting Server response into variable
    var datauser = jsonDecode(response.body);
    // If Web call Success than Hide the CircularProgressIndicator
    if(response.statusCode == 200){
      setState(() {
        visible = false;
      });
      //print(datauser);
      //print(response.statusCode);
      //json.decode(response.body);
    }/*else {
      print(response.body);
    }*/

    // Showing Alert Dialog with Response JSON
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("User registered"),
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height:20),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'User Registration Form',
                  style: TextStyle(fontSize: 25, color: Colors.purpleAccent),
                ),
              ),
              Divider(),

              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: userName,
                    autocorrect: true,
                    decoration: InputDecoration(hintText: 'Enter your Name '),
                  )
              ),
              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: emailAddress,
                    autocorrect: true,
                    decoration: InputDecoration(
                        hintText: 'Enter your emailAddress '),
                  )
              ),
              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: password,
                    autocorrect: true,
                    obscureText: true,
                    decoration: InputDecoration(hintText: 'Enter your Password  '),
                  )
              ),
              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller:  contact,
                    autocorrect: true,
                    decoration: InputDecoration(hintText: 'Enter your Contact number '),
                  )
              ),
              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller:  userAddress,
                    autocorrect: true,
                    decoration: InputDecoration(hintText: 'Enter your Address '),
                  )
              ),
              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller:  userRoleId,
                    autocorrect: true,
                    decoration: InputDecoration(hintText: 'Enter user role '),
                  )
              ),
              RaisedButton(
                onPressed: senddata,
                color: Colors.purple,
                textColor: Colors.white,
                child: Text('Register'),

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