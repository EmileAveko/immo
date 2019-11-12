import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';
import 'Détail.dart';


class Accueil2  extends StatefulWidget {
  _Accueil2State createState() => new _Accueil2State();
}

class _Accueil2State extends State<Accueil2> {

  var donnees;
  var data;
  var morepages;
  String a ="";
  String dara="";
  String respon;
  var photos;
  String chemin="https://immoask.com/tg/uploads/images_biens/";
   static int page=4;
     static     int pics=100;
    int counter =10;
  String yes = 'true';
  String dit ="\"id\"";


  
  String url="https://api.immoask.com/public/graphql?query={biens(count:10,page:81){paginatorInfo{hasMorePages},data{descriptionBien,type,categorie,prix,coordonnee{adresseCommun,ville,quartier},bien_images{libelle},offre{numeroOffre,nature}}}}";
   
  @override
  void initState()
  {
    super.initState();
    this.getData(url);
  }





  Future<String>  getData(String Url) async{


    http.Response response = await http.get(
      Uri.encodeFull(Url),
      headers: {
        "Accept":"application/json",

      }
    );

   
    setState(() {
      var res =json.decode(response.body);

    
     donnees = res;
      data = donnees["data"]["biens"]["data"];
      morepages = donnees["data"]["biens"]["paginatorInfo"]["hasMorePages"];
  
     print(chemin+data[3]["bien_images"][0]["libelle"].toString());
            
    });

    return "success";
  }

  

 

  
 double _myopacity = 0.8;
 int _myduration= 0;
 double _radius = 0;



static Color rouge = Colors.redAccent;


  void change(){
    setState(() {
      _myopacity= _myopacity ==0.8 ? 0.3 :0.8;
      _radius = _radius ==1 ? 0 : 1;
     // _myduration=4;
    });
  }

  TextStyle style = new TextStyle(color: Colors.black,fontSize: 12,fontStyle: FontStyle.italic,decoration:TextDecoration.none,fontWeight:FontWeight.normal);

  TextStyle style1 = new TextStyle(color: Colors.red,fontSize: 12,fontStyle: FontStyle.italic,decoration:TextDecoration.none,fontWeight:FontWeight.bold);


  Widget titre = Container(
    alignment: Alignment.center,
    margin: EdgeInsets.only(top: 20),
    child:
    Text(
      "Les Voisins s'impliquent ...",
      style: new TextStyle(fontStyle: FontStyle.italic,fontSize: 22,color: rouge),
    ),
  );

  static TextStyle _j = new TextStyle(color: Colors.black,fontSize: 18,fontStyle: FontStyle.normal);

  Widget the_text = Container(
    margin: EdgeInsets.only(top: 15,left: 15),

    //alignment: Alignment.center,
    child:
    Text(
      "Un voisin permet a un autre de trouver et d'intégrer son logement en temps réel et réduit. ",
      style:_j ,
    ),

  );

 
  @override
  Widget build(BuildContext context) {
 

    print(donnees);

//Compte compte = new Compte();
var devicesize = MediaQuery.of(context).size;
return new ListView.builder(
    itemCount: data ==null ?1 : counter,
    itemBuilder: (context,index)=> index ==0
         ?  new SizedBox(
        child:
        GestureDetector(
             onTap: (){
               change();
                     },
      child:Tooltip(
          message: " Veuillez toucher pour Animer",
          child:AnimatedOpacity(
                opacity: _myopacity,
                duration: Duration(seconds: 2),
                child:   AnimatedContainer(
                      duration:Duration(seconds: 2),
                      decoration:  BoxDecoration(
                                      image: DecorationImage(image: AssetImage("images/cham7.png"), fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(_radius)
                                    ),

                    child: Column(
                    children: [

            titre,
            the_text,
              Container(
                  margin: EdgeInsets.only(top: 50),
                  child: RaisedButton(

                    child: Container(
                      decoration: BoxDecoration(
                          gradient:LinearGradient(colors: <Color>[
                          Colors.deepOrange,
                            Colors.red,
                            Colors.deepOrangeAccent,
                            Colors.redAccent,


                          ]),
                          //  borderRadius: BorderRadius.circular(8.5),
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Text("Créer un compte voisin",style: new TextStyle(color: Colors.white),),
                      padding: EdgeInsets.all(20),
                    ),
                    shape:RoundedRectangleBorder(side: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(30)),

                    padding: EdgeInsets.all(0),
                    onPressed: ()=>{ 
                      Navigator.pushNamed(context,"/compte")
                    },
                  )
              )
                    ]
                    ),

          height: devicesize.height * 0.415,
        )
           )
           )
        )
    )
 : index == counter-1 ? GestureDetector(
   child: Padding
   (child:
   Center(child:Text("Bien plus d'images")),
   padding: EdgeInsets.all(7),
   ),
   onTap:(){
     setState(() {
    counter=counter+10; 

     });
     }
   )
   : _gethome(context, index));
  }



  Widget _gethome(BuildContext context,int index){
    var devicesize = MediaQuery.of(context).size;

   //change();

    return new Container(
      

      padding: EdgeInsets.only(right: 0.7,left: 0.7),

        //color:Colors.white
        margin: EdgeInsets.only(bottom:2,top: 10),
        child:  data ==null ? (context,index)=> Center(child: Text("Oups ,Probléme de connexion")) :Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: <Widget>[

        Divider(indent: 0,endIndent: 0,height: 10,color: rouge),

        Flexible(
          fit:FlexFit.loose,
          
          child:Padding(
              padding: EdgeInsets.only(top:12.0,right: 3,left: 3),
        child:Container(height:420 ,
              child:ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:   data[index-1]["bien_images"].length,

                itemBuilder: (BuildContext context,int count){

                  return
                     Stack(
                       alignment: AlignmentDirectional.topEnd,
                         children:[Card(
                          
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      child:ClipRRect(
                        
                        borderRadius: BorderRadius.circular(10),
                      child: Image.network(data[index-1]["bien_images"][count]["libelle"]==null ? Center(child: Text("Image manquante"),) : chemin+data[index-1]["bien_images"][count]["libelle"].toString(),fit: BoxFit.cover,width: 345,height: 420),
                        
                      )
                     ),
                           Opacity(
                             opacity: 0.5,
                          
                             child:
                             Padding(
                               padding: EdgeInsets.all(10),
                               child:
                              Container(
                             
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(7),
                                 color: Colors.black

                               ),
                               child: Text((" "+(count+1).toString()+"/"+(data[index-1]["bien_images"].length.toString())+" ").toString(),style: TextStyle(color:Colors.white),),
                              )
                               ),
                           )

                         ]);

              },

              )
          )
        /* Card(
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
          child:ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(_listmodel[index].image,fit: BoxFit.cover,width: 330,height: 400),
          )
         )*/
          )

        ),

        Padding(
            padding:const EdgeInsets.only(right:6,left: 6),
            child: Container(
              decoration: new BoxDecoration(
                border: Border.all(color:rouge),
                borderRadius: BorderRadius.circular(8)
              ),
                margin: EdgeInsets.only(bottom: 5),
                child:
                 Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    Container(

                        width:(devicesize.width*0.30),
                        margin: EdgeInsets.only(right: 0,left: 10),
                        child:
                        Column(
                            children:[new Text(data[index-1]["offre"]["numeroOffre"]==null || data[index-1]["prix"]==null ? data[index-1]=data[index]:"NOI:"+data[index-1]["offre"]["numeroOffre"].toString(),textAlign: TextAlign.center,style:style ,),Text(data[index-1]["prix"].toString()+" Fr/mois",style: style,textAlign: TextAlign.center,)]
                        )
                    ),




                    Container(
                      width:(devicesize.width*0.43),
                      decoration: BoxDecoration(
                        border: BorderDirectional(end: BorderSide(color: rouge),start: BorderSide(color: rouge)),
                        shape: BoxShape.rectangle,
                        //borderRadius: BorderRadius.circular(10.0),
                       // color: Colors.blueAccent,
                      ),
                      margin: EdgeInsets.only(right: 0),
                      child:
                          Padding(
                            padding:EdgeInsets.all(5),
                      child:Column(
                          children:[ Text("A "+data[index-1]["offre"]["nature"]+": "+data[index-1]["categorie"].toString()+" "+data[index-1]["type"].toString(),style: style,textAlign: TextAlign.center,),Text(data[index-1]["coordonnee"]["ville"].toString()+","+data[index-1]["coordonnee"]["quartier"].toString(),style: style,textAlign: TextAlign.center,)]
                      )),

                    )
                    ,
                    Container(

                      width: devicesize.width*0.14,
                        margin: EdgeInsets.only(left: devicesize.width*0.030),
                        alignment: Alignment(0, 0),
                        child:Center(
                            child:InkWell(
                              onTap: (){
                                Detail(prix:data[index-1]["prix"].toString(), descrip:data[index-1]["descriptionBien"].toString(), quartier:data[index-1]["coordonnee"]["quartier"].toString());
                                Navigator.push(context,MaterialPageRoute(builder: (context) =>Detail( nom: data[index-1]["offre"]["numeroOffre"].toString()+data[index-1]["type"].toString()+""+data[index-1]["offre"]["nature"].toString(),image:chemin+data[index-1]["bien_images"][0]["libelle"].toString(),pictures: data[index-1]["bien_images"],prix:data[index-1]["prix"].toString(), descrip:data[index-1]["descriptionBien"].toString(), quartier:data[index-1]["coordonnee"]["quartier"].toString())));   
                              },
                                child:Text("integrer",style: style1,textAlign: TextAlign.center)
                                )
                        )
                    )
            ]
    )
    ]
    )
    )
    )
    ]
    )
    );






  }
}

class Modele {
  //--- Name Of City
  final String ref;

  final String prix;

  //-- image

  //--- population
  final String piece;

  //--- country
  final String quartier;

  final String integrer;

  final String image;

  Modele({this.ref, this.prix, this.piece, this.quartier, this.integrer,this.image});



  static List<Modele> lischam()
  {
    

    var model = new List<Modele>();
    model.add(new Modele(ref: "4401",prix:"50000 Fr/mois",quartier: "Adidogomé,Lomé,Togo",integrer: "integrer",piece: "chambre salon a louer",image: "images/cham1.png"));
    model.add(new Modele(ref: "4401",prix:"5000000 Fr/mois",quartier: "Agoé,Lomé,Togo",integrer: "integrer",piece: "chambre salon a louer",image: "images/cham1.png"));
    model.add(new Modele(ref: "4401",prix:"50000 Fr/mois",quartier: "Legbacito,Lomé,Togo",integrer: "integrer",piece: "chambre salon a louer",image: "images/cham2.png"));
    model.add(new Modele(ref: "4401",prix:"50000 Fr/mois",quartier: "Abalépédogan,Atakpamé,Togo",integrer: "integrer",piece: "chambre salon a louer",image: "images/cham3.png"));
    model.add(new Modele(ref: "4401",prix:"50000 Fr/mois",quartier: "Abalépédogan,Atakpamé,Togo",integrer: "integrer",piece: "chambre salon a louer",image: "images/cham4.png"));
    model.add(new Modele(ref: "4401",prix:"50000 Fr/mois",quartier: "Abalépédogan,Atakpamé,Togo",integrer: "integrer",piece: "chambre salon a louer",image: "images/cham5.png"));
    model.add(new Modele(ref: "4401",prix:"50000 Fr/mois",quartier: "Abalépédogan,Atakpamé,Togo",integrer: "integrer",piece: "chambre salon a louer",image: "images/cham6.png"));
    model.add(new Modele(ref: "4401",prix:"50000 Fr/mois",quartier: "Abalépédogan,Atakpamé,Togo",integrer: "integrer",piece: "chambre salon a louer",image: "images/cham7.png"));
    return model;
  }





}

