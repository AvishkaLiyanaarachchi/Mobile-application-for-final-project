import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:convert' as JSON;
import 'package:http/http.dart' as http;
import 'package:railwaystationmasterflutter/homePage.dart';

class EmailFeildValidator{
  static String validate(String value){
    return value.isEmpty ? 'Email cannot be empty' : null;
  }
}

class PasswordFeildValidator{
  static String validate(String value){
    return value.isEmpty ? 'Password cannot be empty' : null;
  }
}
class Login extends StatefulWidget{

  _LoginState createState()=> _LoginState();
}
final GlobalKey <ScaffoldState>_scaffoldKey = new GlobalKey<ScaffoldState>();

class _LoginState extends State<Login>{

  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  String user_email;
  String password;

  loginIn(String user_email,password) async{
     try{
       final data = {
         'user_email': user_email,
         'password': password
       };
       var jsonData = null;
       var response = await http.post("http://10.0.2.2:80/RailwayAPI/railwayAPI.php/loginDetailsStationMaster",body: jsonEncode(data));
       if(response.statusCode == 200){
         print(response.statusCode);
         jsonData = JSON.json.decode(response.body);
         print(response.body);
         if(jsonData){
           setState(() {
             _isLoading = false;

             // sharedPreferences.setString("token", jsonData('token'));
             Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => HomePage()),(Route<dynamic> route) => false);
             //Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));

           });
         }else{
           print('Invalid email and password');

         }

       }else{
         print(response.body);
       }
     }on Exception catch(exception){
       print(exception.toString());
     }

     showDialog(
       context: context,
       builder: (BuildContext context) {
         return AlertDialog(
           title: new Text("Login successfully"),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[900],
      key: _scaffoldKey,
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(15.0, 80.0, 15.0, 10.0),
            child: Column(
              children: [
                Container(
                    child:Column(
                      children: [
                        SizedBox(height:20),
                        Text('Welcome Back',
                          style: TextStyle(
                            fontSize: 35.0,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF1287A5),
                          ),
                        ),
                      ],
                    )
                ),
                SizedBox(height:30),
                Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.teal,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email, color: Color(0xFF1287A5),),
                            hintText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                          validator: EmailFeildValidator.validate,
                          onSaved: (value) =>  user_email =  value,
                          //onSaved: (value) =>  user_email =  value,
                          //validator: (value)=> value.length == 0? "Email cannot be empty" : null,
                        ),
                        SizedBox(height:20),
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          cursorColor: Colors.teal,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock, color: Color(0xFF1287A5),),
                            hintText: 'Password',
                            border: OutlineInputBorder(),
                          ),
                          validator: PasswordFeildValidator.validate,
                          onSaved: (value) => password =  value,
                          //onSaved: (value) => password =  value,
                          //validator: (value)=> value.length == 0? "Password cannot be empty" : null,
                        ),
                        SizedBox(height:20),
                        //SizedBox(height:20),
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Login cannot be empty';
                            }
                            return null;
                          },
                        ),
                        RaisedButton(
                          onPressed: (){

                            //Navigator.of(context).pushNamed(Home.tag);
                            setState(() {
                              _isLoading = true;
                            });
                            loginIn(emailController.text,passwordController.text);
                            //_showcontent;
                            // Validate returns true if the form is valid, or false
                            // otherwise.
                            if (_formKey.currentState.validate()) {
                              // If the form is valid, display a Snackbar.
                              Scaffold.of(context)
                                  .showSnackBar(
                                  SnackBar(content: Text('Login successfully')));
                            }
                          },
                          color: Color(0xFF1287A5),
                          textColor: Colors.white,
                          child: Text('LOGIN',style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),),
                        ),

                      ],
                    )
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

}