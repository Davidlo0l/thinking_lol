

import 'package:flutter/material.dart';
import 'package:thinking_app/src/screen/Home.dart';
import 'package:thinking_app/mixins_validate/validate_mixins.dart';
import 'package:thinking_app/src/utlities/noscroll.dart';

class Login_Screen extends StatefulWidget  {
  @override
  _Login_ScreenState createState() => new _Login_ScreenState();
 }
class _Login_ScreenState extends State<Login_Screen> with ValidateMixins {
  //para la validacion creamos una variable llamada formkey
  final GlobalKey<FormState>formkey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
   return new Scaffold(
      body: new Container(
      
      decoration: new BoxDecoration(
      image: new DecorationImage(
      image: new AssetImage("images/"),
      fit: BoxFit.cover,

      )
      ),
     margin: EdgeInsets.all(30.0),
     child: new  Form(
       //enviamos la validacion por parametro
       key: formkey,
       child: ScrollConfiguration(
        behavior: HiddenScrollBehavior(),
        child: ListView(
         children: <Widget>[
            Image.asset("images/logo.png",
              width:164.0,
              height: 160.0,
             ),
             Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.0),  
              ),
         
       
       
          Column(
         children: <Widget>[  
        emailField(),
        passwordField(),
        //la forma mas optima de hacer una margen es aqui 
        Container( margin: EdgeInsets.only(top: 40.0),),
        submitField(),
         Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),  
              ),
      
        InkWell(
            child: Text(" ¿Olvidaste tu contraseña? ",
            style: TextStyle( color :Colors.blueAccent)),
            onTap: () async {
           
    
  },
),

         ],

       ),

],
     )
      ), 
       
     )
   )
   );
  }
    Widget emailField(){
       
         return TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
          labelText: "Email",
          hintText: "ejemplo@example.com",
          icon: Icon(Icons.email),
          
       ),  
        
         validator: validateEmail,  
       );
   }
   Widget passwordField(){
     
        return TextFormField(
        
         obscureText: true,
         autocorrect: false,
         decoration: InputDecoration(
         labelText: "Contraseña",
         hintText: "Contraseña",
         icon: Icon(Icons.lock),
         
         
       ), 
       validator: (value){
         print('save'+ value);
         if(value.length < 6)
         
         return "la contraseña debe ser mayor a 6 caracteres";
         
       },
       onSaved: (String value){



       }
        );
     
   }
   Widget submitField(){
     
     return  RaisedButton(
      child:  Text("Ingresar"),
      
       color: Colors.blue[300],
       padding: EdgeInsets.symmetric(horizontal:130.0 ),
      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
       //parametro vacio mientas 
      onPressed: (){
     
        //cuando oprime se reinician los campos 
        //formkey.currentState.reset();
        if(formkey.currentState.validate()){
              Navigator.push(
          context,
         MaterialPageRoute(builder: (context) => Home()),
  );
          formkey.currentState.save();
        }
       
      },
      

     );
   
  }
}