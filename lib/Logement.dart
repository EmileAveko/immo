import 'package:flutter/material.dart';




class Chambre {

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

  Chambre({this.ref, this.prix, this.piece, this.quartier, this.integrer,this.image});


  static List<Chambre> lischam()
  {
    var chambre = new List<Chambre>();

    chambre.add(new Chambre(ref: "4401",prix:"50000/mois",quartier: "Adidogomé,Lomé,Togo",integrer: "integrer",piece: "chambre salon a louer",image: "images/cham1.png"));
    chambre.add(new Chambre(ref: "4401",prix:"50000/mois",quartier: "Adidogomé,Lomé,Togo",integrer: "integrer",piece: "chambre salon a louer",image: "images/cham2.png"));
    chambre.add(new Chambre(ref: "4401",prix:"50000/mois",quartier: "Adidogomé,Lomé,Togo",integrer: "integrer",piece: "chambre salon a louer",image: "images/cham3.png"));
    return chambre;
  }
}

class HomePage extends StatelessWidget {

  final List<Chambre> _list = Chambre.lischam();

  HomePage() ;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

        body: new Padding(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: getHomePageBody(context)));
  }

  getHomePageBody(BuildContext context) {
    return ListView.builder(
      itemCount: _list.length,
      itemBuilder: _getItemUI,
      padding: EdgeInsets.all(0.0),
    );
  }
  // First Attempt


  Widget _getItemUI(BuildContext context, int index) {
    return new Card(
        child: new Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            new ListTile(
              leading: new Image.asset(
                  _list[index].image,
                fit: BoxFit.cover,
                width: 100.0,

              ),

              title: new Text(
               "Piéce:"+ _list[index].piece,
                style: new TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
              ),
              subtitle: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text('Prix:'+_list[index].prix,
                        style: new TextStyle(
                            fontSize: 13.0, fontWeight: FontWeight.normal)),
                    new Text('lieu: ${_list[index].quartier}',
                        style: new TextStyle(
                            fontSize: 11.0, fontWeight: FontWeight.normal)),
                  ]),
              //trailing: ,
            /*  onTap: () {
                _showSnackBar(context, _allCities[index]);
              },*/
            )
          ],
        )
    );
  }
}