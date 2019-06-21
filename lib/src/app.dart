import 'package:flutter/material.dart';
 
import 'dart:async';
import 'package:thinking_app/src/screen/login_screen.dart';

class App extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return new MaterialApp(
   
    title:"iniciar secion",
     debugShowCheckedModeBanner: false,
      home:SplashScreen(),
     
      routes: <String, WidgetBuilder>{
      '/Login_Screen': (BuildContext context) => new Login_Screen()
    },
   
     
    );
 
 }
}
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/Login_Screen');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: new Container(

        child: new Column(
          children:<Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 100.0),  
              
          ),
          new  Image.asset("images/logo.png"),
          new Center( 
           child :CircularProgressIndicator(
           valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
           
          )
        ),
          new Text("LOADING...")
        
          ]
       
        ),
    ),
   
     
    );
  }
}