import 'package:flutter/material.dart'
    show BorderRadius, InputDecoration, OutlineInputBorder, TextField, Widget;

class Widgets {
  Widget textBoxSquare({hint}) {
    return TextField(
        obscureText: false,
        showCursor: true,
        //keyboardType: TextInputType.phone,
        decoration: new InputDecoration(
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(10.0),
          ),
          filled: true,
//          prefixIcon: Icon(
//            Icons.mail,
//            color: Theme.of(context).accentColor,
//          ),
          hintText: hint,
          //hintStyle: TextStyle(fontSize: 10, fontStyle: FontStyle.normal)
        ));
  }
}
