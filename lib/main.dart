import 'package:flutter/material.dart';
import 'navigation.dart';
import 'Détail.dart';
import 'Compte.dart';

import 'package:flutter/services.dart';
import 'Inscription.dart';
import 'package:immoproject/Screens/Login/index.dart';

final Compte _compte = Compte();
final Navigation _navigation = Navigation("0");
final Detail _detail = Detail();
final Inscription _inscription = Inscription();
void main  () async{


  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);

 // Routes();

  runApp(
    MaterialApp(
        title: "LesVoisins",
        debugShowCheckedModeBanner: false,
        home:MyApp(),

       routes: {
          "/compte": (_) => _compte,
         "/home":(_)=> _navigation,
         "/detail":(_) => _detail,
         "/inscrire":(_)=>_inscription,
         "/login": (_) => LoginScreen(),
       },

      )
  );
}





class MyApp extends StatefulWidget{

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{


  @override
  void initState(){
    super.initState();
    Future.delayed(
      Duration(
          seconds: 2),
          (){
              //Navigator.push(this.context, MaterialPageRoute(builder: (context)=> Accueil(),));
              Navigator.pushNamedAndRemoveUntil(this.context, "/inscrire",(_) => false);
             },);
  }


  @override
  Widget build(BuildContext context)
  {


    return Container(

      child:
      Material(
        child:

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
     borderRadius: BorderRadius.circular(3),
         child:Image.asset("images/icon.jpg",height: MediaQuery.of(context).size.height*0.75,)
             ),

            Text("Bienvenue Chez vous les voisins "),
          ],

        ) ,
      ),

    );
  }
}


