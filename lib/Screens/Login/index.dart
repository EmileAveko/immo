import 'dart:convert';

import 'package:flutter/material.dart';
import 'styles.dart';
import 'loginAnimation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/animation.dart';
import 'dart:async';
import '../../Components/SignUpLink.dart';
import '../../Components/Form.dart';
import '../../Components/SignInButton.dart';
import '../../Components/WhiteTick.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);
  @override
  LoginScreenState createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen>
    
    
    
    with TickerProviderStateMixin {
  AnimationController _loginButtonController;
  var animationStatus = 0;
  @override
  void initState() {
    super.initState();
    _loginButtonController = new AnimationController(
        duration: new Duration(milliseconds: 3000), vsync: this);
  }

var donnees,connecter;
TextEditingController emailcon = new TextEditingController();
TextEditingController passcon= new TextEditingController();
String id;

  @override
  void dispose() {
    _loginButtonController.dispose();
    super.dispose();
  }

  Future<Null> _playAnimation() async {
    try {
      await _loginButtonController.forward();
      await _loginButtonController.reverse();
    } on TickerCanceled {}
  }


    Future<String>  login(String email,String password) async{
    http.Response response = await http.get(
      Uri.encodeFull("http://api.immoask.com/public/graphql?query={connecter(email:\""+email+"\",motPasse:\""+password+"\"){id,email,typeClient}}"),
      headers: {
        "Accept":"application/json",
      }
    );

    



//    print(donnees[7]['name']);
if(response.statusCode==200)
   {
    setState((){
        var res =json.decode(response.body);
        donnees=res["data"];
        connecter=donnees["connecter"];

        if(connecter!=null)
          {
             id=connecter["id"];
             _playAnimation();
               animationStatus = 1;
          }

       else{
  showDialog(
    context: context,
  builder: (BuildContext context){
    return AlertDialog(content: Text("vous n'etes pas voisin"),);
  });

       }
  
        
    });
   }

    return "success";
  }



  /*Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          child: new AlertDialog(
            title: new Text('Are you sure?'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, "/home"),
                child: new Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }*/

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.4;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return (new WillPopScope(
      //
      //
      //      hyq c   
         onWillPop: null,
        child: new Scaffold(
          body: new Container(
              decoration: new BoxDecoration(
                image: backgroundImage,
              ),
              child: new Container(
                  decoration: new BoxDecoration(
                      gradient: new LinearGradient(
                    colors: <Color>[
                      const Color.fromRGBO(162, 146, 199, 0.8),
                      const Color.fromRGBO(51, 51, 63, 0.9),
                    ],
                    stops: [0.2, 1.0],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(0.0, 1.0),
                  )),
                  child: new ListView(
                    padding: const EdgeInsets.all(0.0),
                    children: <Widget>[
                      new Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: <Widget>[
                          new Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              new Tick(image: tick),
                              new FormContainer(emailcon,passcon),
                              new SignUp(),
                              
                            ],
                          ),
                          animationStatus == 0
                              ? new Padding(
                                  padding: const EdgeInsets.only(bottom: 50.0),
                                  child: new InkWell(
                                      onTap: () {
                                        setState(() {
                                         login(emailcon.text, passcon.text);
                                        });
                                       
                                      },
                                      child: new SignIn()),
                                )
                              : new StaggerAnimation(
                                cle: id,
                                  buttonController:
                                      _loginButtonController.view
                                      ),
                        ],
                      ),
                    ],
                  ))),
        )));
  }
}
