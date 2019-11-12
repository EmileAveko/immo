import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;


class Compte  extends StatefulWidget {
  @override
  _CompteState createState() => _CompteState();
}

class _CompteState extends State<Compte> {
  @override


  var donnees,enregistrer;
static TextEditingController numero= new TextEditingController();
static TextEditingController maile = new TextEditingController();
static TextEditingController pass = new TextEditingController();

Future<String>  SignUp(String email,String password,String number) async{

  if(email.contains(RegExp("#[A-Za-z0-9.!#\$%&'*+/=?^_`{|}~-]*@[a-zA-Z].[a-z]{2,3}\$#"))&& number.contains(RegExp("#[0-9]+[^A-Za-z.!#\$%&'*+/=?^_`{|}~-]*@[a-zA-Z]#")) && password.contains(RegExp("#[A-Za-z0-9]+[.!#\$%&'*+/=?^_`{|}~-]*#")) && password.length>=8)
     {
    http.Response response = await http.get(
      Uri.encodeFull("https://api.immoask.com/public/graphql?query=mutation{enregistrerLocataire(login:\"mobileimmoask\",motPasse:\""+password+"\",numeroTelephone:\""+number+"\",typeClient:\"151\",email:\""+email+"\"){email,id}}"),
      headers: {
        "Accept":"application/json",
      }
    );

    



//    print(donnees[7]['name']);
if(response.statusCode==200)
   {
   
        var res =json.decode(response.body);
        donnees=res["data"];
        enregistrer=donnees["enregitrerLocataire"];


        if(enregistrer!=null)
          {
            showDialog(
    context:context ,
  builder: (BuildContext context){
    return AlertDialog(content: Text("Vous vous etes bien inscrit"),);
  });
          }

       else{
       }

    }
  
     }       
   

if(email.isEmpty || password.isEmpty || number.isEmpty)
{
  if(email.isNotEmpty)
  {
     showDialog(
   context: context,
      builder: (BuildContext context){
       return AlertDialog(content: Text("Veuillez remplir l'email"),);
  });
  }
  
     if(password.isNotEmpty)
  {
     showDialog(
    context: context,
      builder: (BuildContext context){
       return AlertDialog(content: Text("Veuillez remplir le mot de passe"),);
  });
  }
   
     if(number.isNotEmpty)
  {
     showDialog(
    context:context ,
      builder: (BuildContext context){
       return AlertDialog(content: Text("Veuillez remplir votre  numéro de téléphone"),);
  });
  }

  
  if(email.isEmpty && password.isEmpty && number.isEmpty)
      {  
            showDialog(
    context: context,
  builder: (BuildContext context){
    return AlertDialog(content: Text("Veuillez remplir tous les champs"),);
  });
}
}

      
     return "success";
  

}

static String texte =" Devenir un de nos voisins et gagner meme en alertant la disponibilité de votre logement";



  Widget titre = Container(
    margin: EdgeInsets.only(top: 10),
    child: Text(
        " Etes vous locataire ? ",
      style: new TextStyle(fontSize: 22,fontStyle: FontStyle.italic,color: Colors.red),
    ),
  );

  Widget text = Container(
    margin: EdgeInsets.only(top: 10,left: 5,right: 5,),
   child: Text(texte
     ,maxLines: 3, style: new TextStyle(fontSize: 18,fontStyle: FontStyle.normal),),
  );


  Widget mail = Container(
  //  margin: EdgeInsets.only(bottom: 120),
    child: TextField(
      controller: maile,
keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          //border:,
        
        labelText: 'Email',
          hintText: 'Email',
          labelStyle: TextStyle(color:Colors.red),
        hintStyle: TextStyle(color: Colors.red)
      ),
    ),

  );


Widget number = Container(
 // margin: EdgeInsets.only(bottom: 120),
  child:  TextField(
    controller: numero,
    keyboardType: TextInputType.number,
      decoration: InputDecoration(
          fillColor: Colors.red,
          focusColor: Colors.red,
          hoverColor: Colors.red,

          hintText: 'N Tel ou WhatsApp',
              labelText: 'N Tel ou WhatsApp',
          labelStyle: TextStyle(color:Colors.red),
      hintStyle: TextStyle(color: Colors.red)
      ),
    ),

);


Widget password = Container(
  padding: EdgeInsets.only(right: 5,left: 5),
  margin: EdgeInsets.only(top: 70,bottom: 120),
  child: TextFormField(
    controller: pass,
    obscureText: true,
    decoration: InputDecoration(
      labelText: 'Mot de passe',
      hintText:  'Mot de passe',
      labelStyle: TextStyle(color:Colors.red),
        hintStyle: TextStyle(color: Colors.red)
    ),
  ),

);



  Widget nom= Container(
    padding: EdgeInsets.only(right: 5,left: 5),
    margin: EdgeInsets.only(top: 20),
    child: TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          labelText: 'Nom',
          hintText:  'Nom',

      ),
    ),

  );

  Widget adresse= Container(
    padding: EdgeInsets.only(right: 5,left: 5),
    margin: EdgeInsets.only(top: 20,bottom: 60),
    child: TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          labelText: 'Adresse',
          hintText:  'Adresse'
      ),
    ),

  );


  Widget reinitialiser= Container(


    child: RaisedButton(
      onPressed: null,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: <Color>[
              Colors.red,
              Colors.deepOrangeAccent,
              Colors.deepOrange,
            ]),
            //  borderRadius: BorderRadius.circular(8.5),
            borderRadius: BorderRadius.circular(30)
        ),
    
        padding: EdgeInsets.all(20),

      child: Text("réinitialiser",style: new TextStyle(color: Colors.white),),
    ),
  padding: EdgeInsets.all(0.0),
    shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(50)),)
  );

  Widget creation= Container(
      margin: EdgeInsets.only(top: 20),
      child: RaisedButton(
onPressed: null,

      )
  );



  Widget build(BuildContext context) {
   
 //   double taille_ecran= MediaQuery.of(context).size.width;
    return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.red,
       automaticallyImplyLeading: true,
       title: Text("Creer un Compte",style:TextStyle(fontSize: 23) ,),
     ),
       body: SingleChildScrollView( child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: <Widget>[
           titre,
           text,

           // Flexible(
           Padding(
             padding: EdgeInsets.only(left: 5,right: 5),
           child:Row(
             children:[
               Flexible(child: Row(children: <Widget>[Flexible(flex: 7,child: mail), Spacer(flex: 1,),Flexible(flex:7,child: number)],
    ),
               flex: 1,
               )
             ]
           )
       //    )
       ),
          password,
         //  nom,
           //adresse,

           Row(
             children: <Widget>[
              reinitialiser,
          // creation,


               SizedBox(
                 width: MediaQuery.of(context).size.width*0.015,
               ),

           RaisedButton(
            
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                    Colors.redAccent,
                    Colors.deepOrangeAccent,
                    Colors.red,
                  ]),
                //  borderRadius: BorderRadius.circular(8.5),
                borderRadius: BorderRadius.circular(30)
                ),
                child: Text("Créer maintenant",style: new TextStyle(color: Colors.white),),
                padding: EdgeInsets.all(20),
              ),
           shape:RoundedRectangleBorder(side: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(30)),

           padding: EdgeInsets.all(0),
           onPressed: ()=>{
             //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Navigation()))
             SignUp(maile.text,pass.text , numero.text)
           },),


SizedBox(
  width: MediaQuery.of(context).size.width*0.015,
),

           RaisedButton(

    child: Container(
    decoration: BoxDecoration(
    gradient: LinearGradient(colors: <Color>[
    Colors.deepOrange,
    Colors.red,
    Colors.deepOrangeAccent,
    ]),
    //  borderRadius: BorderRadius.circular(8.5),
    borderRadius: BorderRadius.circular(30)
    ),
           child: Text("Ignorer",style: TextStyle(color: Colors.white),),
         padding: EdgeInsets.all(20)
    ),
                 padding: EdgeInsets.all(0),
                 onPressed: ()=>{
           Navigator.pushNamed(context,"/home")
           },
               shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(30)),
             )

             //  Spacer(flex: 0),
             ],
           )

       ]),

       ) );
  }
}
