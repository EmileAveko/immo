import 'package:flutter/material.dart';
import 'Accueil2.dart';
import 'Alerter.dart';

import 'Logement.dart';


  class Navigation  extends StatefulWidget {
  String cle;
  Navigation(cle);
  @override
  _NavigationState createState() => _NavigationState();
}

 class _NavigationState extends State<Navigation> {
  @override

 

  final Accueil2 _accueil2 =  Accueil2();
  
  final HomePage _homePage = HomePage();

  //final Alerter _alerter = Alerter();

  Choice _selectedChoice = choices[0];

 String _titre="LesVoisins";

  int _index = 0;

 Drawer drawer ;

 

  Widget counter( int _index) {
    switch (_index) {
        case 0: {return _accueil2;}
        case 1: { 
          //String id = widget.cle;
         // print(id);
          return Alerter(widget.cle);
          }
        case 2: {return _homePage;}//return _homePage;

        break;

       default: {_titre="LesVoisins";return _accueil2;}
    }
  }

  Widget build(BuildContext context) {
    return Container(

      child: Scaffold(

        appBar: new AppBar(
          automaticallyImplyLeading: true,

        backgroundColor: Colors.red,
        title: Text(_titre),
         actions: <Widget>[


           PopupMenuButton<Choice>(

             itemBuilder: (BuildContext context){
             return choices.map((Choice choice){
               return PopupMenuItem<Choice>(
                 value: choice,
                 child: Card(
                   color: Colors.red,
                child: Row(
                     children:[
                   Icon(choice.icon,color: Colors.white,),  Text(choice.title,style: TextStyle(color: Colors.white))],
               )));
             }).toList();

           },
           onSelected:  (Choice choice)
               {
               setState(() {
               _selectedChoice = choice;
                showAlertDialog(context,choice.title,choice.content);
            //Navigator.of(context).push(MaterialPageRoute(builder: (context) => Equipe()));
               //return AlertDialog(title: Text("a"),);
               });
               },
           ),
    /*  Theme
        ,
        data: Theme.of(context).copyWith(
          cardColor: Colors.indigo,
          iconTheme: IconThemeData(color: Colors.white),
        ))*/
         ],
    ),


    body: counter(_index),
  drawer:drawer,
        bottomNavigationBar:

             BottomNavigationBar(
              // backgroundColor: Colors.lightBlueAccent,
               selectedItemColor: Colors.redAccent,
                 currentIndex: _index,
                 iconSize: 20,
                 onTap: (value){
                 _index=value;
                 setState(() {
                   if(_index==0){
                     drawer=null;
                     _titre="LesVoisins";
                   }

                   if(_index ==1){
                     drawer=showDrawer(context);
                     _titre ="Alerter";
                   }

                   if(_index ==2){
                     drawer=null;
                     _titre="Logements";
                   }

                 });
               },

                 items: [
                   BottomNavigationBarItem(
                     icon: Icon(Icons.home),
                     title: Text("Accueil"),
                   ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.add_alert),
                      title: Text("Alerter"),
                   ),
                   BottomNavigationBarItem(
                     icon: Icon(Icons.list),
                     title: Text("historique"),
                   )



                 ]
             ),
      ),
    );
  }
}

class Choice {
  const Choice ({this.title, this.icon,this.content});

  final String title;
  final IconData icon;
  final String content;


}

 const List<Choice> choices = const <Choice>[
   Choice(title: "Equipe",icon: Icons.arrow_forward,content:" L'équipe d'ImmoAsk vous souhaite la bienvenu"),
   Choice(title:" A propos",icon:Icons.arrow_forward,content:"Les voisins vous offre la possibilité de vous affiliez" ),
   Choice(title:" Termes et Conditions",icon:Icons.arrow_forward,content: "politique ainsi faite"),

 ];





showAlertDialog(BuildContext context,String titre,String contenu) {
  // set up the buttons
  Widget okButton = FlatButton(
    child: Text("OK",style: TextStyle(color: Colors.redAccent),),
    onPressed: () {Navigator.pop(context);},
  );
  Widget cancelButton = FlatButton(
    child: Text("Quitter",style: TextStyle(color: Colors.redAccent),),
    onPressed: () {Navigator.pop(context);},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(titre),
    content: Text(
        contenu),
    actions: [
      okButton,
      cancelButton,
    //  launchButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Drawer showDrawer(BuildContext context){

  var header = DrawerHeader(
    child: Text("Alerter"),
    decoration: BoxDecoration(color: Colors.red),
  );
  ListTile buildnavItem(var icon,String label,String route){
    return ListTile(
      leading: icon,
      onTap:(){
        Navigator.pop(context);
        //   Navigator.pushNamed(context, route);

      },
      title: Text(label),
    );

  }

  var listnav=[
    header,
    buildnavItem(Icon(Icons.notifications), "Tableau de bord", ""),
    buildnavItem(Icon(Icons.more), "En savoir plus", ""),
  ];

  ListView list = ListView(children: listnav);

  return Drawer(child: list,elevation: 1,);
}
