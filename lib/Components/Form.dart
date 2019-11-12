import 'package:flutter/material.dart';
import './InputFields.dart';

class FormContainer extends StatelessWidget {
 final TextEditingController emailcontrol;
 final TextEditingController passwordcontrol;

 FormContainer(this.emailcontrol,this.passwordcontrol);
 
  @override
  
  Widget build(BuildContext context) {  
    return (new Container(
      margin: new EdgeInsets.symmetric(horizontal: 20.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Form(
              child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new InputFieldArea(
                controller: emailcontrol,
                hint: "email",
                obscure: false,
                icon: Icons.email,
              ),
              new InputFieldArea(
                controller: passwordcontrol,
                hint: "Password",
                obscure: true,
                icon: Icons.lock_outline,
              ),
            ],
          )),
        ],
      ),
    ));
  }
}
