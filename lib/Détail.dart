

import 'package:flutter/material.dart';



class Detail extends StatefulWidget{


 final dynamic pictures;

final String chemin="https://immoask.com/tg/uploads/images_biens/";
  final String prix;

  //-- image

  //--- population
  final String descrip;

  //--- country
  final String quartier;

 final String nom;

  String image;
  

  

  Detail({ this.nom,this.image, this.pictures,this.prix, this.descrip, this.quartier});
@override
  _DetailState createState() => new _DetailState();//this.nom,this.quartier,this.image,this.descrip,this.pictures,this.prix

}

class _DetailState extends State<Detail>{
/*String nom,quartier,image,descrip,prix;

dynamic pictures;*/
int compteur = 4; 
String chemin="https://immoask.com/tg/uploads/images_biens/";

_DetailState();

@override
  Widget build(BuildContext context){
   InkWell plus;


    return Scaffold(
      appBar: AppBar(
       title: Text(widget.nom,style: TextStyle(color: Colors.white),),
       backgroundColor: Colors.red,
      ),
      body:SingleChildScrollView(child:Container(
    color: Colors.white,
    child:   Column(
       mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
       
       Container(
         height: 300,
    child:   Card(
                          
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      child:ClipRRect(
                        
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(widget.image,fit: BoxFit.cover,width: 345,height: 320),
                      )
                     ),
       ),

Container( 
  alignment: Alignment(1, 1),
   child:
   Text("Prix:"+widget.prix)
   ),

       Container(
       child:  Text("Quartier:"+widget.quartier),
       ),
   
       Container( 
         margin: EdgeInsets.all(20),
         child: Text("Description:"+widget.descrip)
         ),

 Container(
           width: 180,
           height: 180,
           child: ListView.builder(
             itemCount: widget.pictures.length <= 3 ? widget.pictures.length : compteur ,
             scrollDirection: Axis.horizontal,
             itemBuilder: (BuildContext context,int index){ 
              index==compteur - 1 ? widget.pictures.length >=compteur ? plus= new InkWell(
      child: Icon(Icons.arrow_right,color: Colors.black),
      onTap: (){
           setState(() {
             if(widget.pictures.length-compteur >=3)
             compteur=compteur+3;
             if(widget.pictures.length-compteur <3)
             compteur=compteur+(widget.pictures.length-compteur); 
           });
      },
    ):plus=null :

               Padding( 
                padding: EdgeInsets.all(10),
                child:Card(
                  margin: EdgeInsets.all(5),
                child:ClipRRect(
                  borderRadius: BorderRadius.circular(10),
              child: GestureDetector(
                child:  Image.network(chemin+widget.pictures[index]["libelle"].toString()),
                onDoubleTap: (){
                  setState(() {
                    widget.image=chemin+widget.pictures[index]["libelle"].toString();
                    widget.pictures.remove(widget.pictures[index]["libelle"].toString());
                  });
                },
                ))
               )) ;
             },
           ),
         ),




        ],

     ),
      )
     )
      );

  }



}



/*
 Widget corps(String descrip,var pictures,String prix,String quartier){

  return Container(
     child: Column(
        children: <Widget>[
         Container(
           width: 50,
           height: 40,
           child: ListView.builder(
             itemCount: pictures.length,
             scrollDirection: Axis.horizontal,
             itemBuilder: (BuildContext context,int index){
              return Image.network(pictures[index].toString());
             },
           ),
         ),

         Text("Description:"+descrip),
         Text("Prix:"+prix),
         Text("Quartier:"+quartier),

        ],

     ),

  );

 }*/