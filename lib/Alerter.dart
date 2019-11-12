import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import  'package:http/http.dart' as http;


class Alerter  extends StatefulWidget {

String locat;
Alerter(locat);
  @override
  _AlerterState createState() => _AlerterState();
}

class _AlerterState extends State<Alerter> {
  @override

 var donnees;
  var data;
  var dat;
  var photos;
  var morepages;
  var res;
 
  String chemin="https://immoask.com/tg/uploads/images_biens/";
    
    
 

  static int nb= 2984;

 //String url = "https://api.immoask.com/public/graphql?query={bienPrisPar(locataire:"+widget.locat+"){offre{numeroOffre,client{id,nomClient}},id,superficie,bien_images{libelle}}}";
   
  @override
  void initState()
  {
    super.initState();
    this.getData();
  }





  Future<String>  getData() async{


    http.Response response = await http.get(
      Uri.encodeFull("https://api.immoask.com/public/graphql?query={bienPrisPar(locataire:"+widget.locat+"){offre{numeroOffre,client{id,nomClient}},id,superficie,bien_images{libelle}}}"),
      headers: {
        "Accept":"application/json",

      }
    );
setState((){
      res =json.decode(response.body);

    print(res);
     donnees = res;
      data = res["data"];
      dat=data["bienPrisPar"];
      photos=dat["bien_images"];
      print(photos);
      print(photos[0].toString());

  });

  }
      
      
      Widget build(BuildContext context) {

    return new Scaffold(
     
      body: Center(
        child: donnees==null ? Text(" veuillez checkez la connexion") :
        
        Image.network(chemin+photos[1]["libelle"].toString())
           
         
           )
           );


      }
}        
