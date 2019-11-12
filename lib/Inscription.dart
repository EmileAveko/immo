

import 'package:flutter/material.dart';




class Inscription extends StatelessWidget{


  Widget build(BuildContext context){



  Widget text = Container(
    child: Text("En savoir plus",style: TextStyle(color: Colors.white),),
  );


    Widget creation=  RaisedButton(
          child: Container(

            decoration: BoxDecoration(
                gradient: LinearGradient(colors: <Color>[
                  Colors.white,
                  Colors.deepOrangeAccent,
                  Colors.white,
                ]),
                //  borderRadius: BorderRadius.circular(8.5),
                borderRadius: BorderRadius.circular(30)
            ),

            padding: EdgeInsets.all(20),

            child: Text("Connectez-Vous",style: new TextStyle(color: Colors.redAccent),)
          ),
          padding: EdgeInsets.all(0.0),
          onPressed: (){
            Navigator.pushNamed(context, "/login");
          },
          shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(50)),);

    Widget inscricre=  RaisedButton(
      child: Container(

          decoration: BoxDecoration(
              gradient: LinearGradient(colors: <Color>[
                Colors.white,
                Colors.deepOrangeAccent,
                Colors.white,
              ]),
              //  borderRadius: BorderRadius.circular(8.5),
              borderRadius: BorderRadius.circular(30)
          ),

          padding: EdgeInsets.all(20),

          child: Text("Inscrivez Vous",style: new TextStyle(color: Colors.redAccent),)
      ),
      padding: EdgeInsets.all(0.0),
      onPressed: (){
       // Navigator.pushNamed(context, "/logout");
   // SignUp(email, password, number);
      },
      shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(50)),);


    return Scaffold(
      body: Container(

        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.red,
            Colors.deepOrangeAccent,
            Colors.redAccent,
            Colors.deepOrange,
          ])
        ),

     child: Column(


      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
   //   crossAxisAlignment: CrossAxisAlignment.stretch,

       children: <Widget>[

         Spacer(flex: 4),
         Flexible(
     flex: 8,
         child:
         Row(children:
         [
           Spacer(flex: 1,)
           ,Flexible(
           flex: 1,
             child:InkWell(
                 child:Icon(Icons.close,color: Colors.white,),
               onTap: (){
                 Navigator.pushNamedAndRemoveUntil(context, "/home",(_)=>false);
               },

             )
         ),

           Spacer(flex:25),
           /*   Flexible(
           child: SizedBox(child: Text("Immo",style: TextStyle(color: Colors.white),)
           )
           )*/
         ],
         ),
     ),

         Spacer(flex: 25),
         Flexible(
           flex: 7,
        child: creation,
       ),

        Spacer(flex: 5,),
      Flexible(
        flex: 7,
        child: inscricre,
      ),


        Spacer(flex: 17,),
        Flexible(
          flex: 3,
          child: text,
        )



       ],
     ),
      ),
    );
  }

}