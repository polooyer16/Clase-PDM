import 'package:flutter/material.dart';

import 'gradient_app_bar.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      body: Stack(
        children: <Widget>[

          GradientAppBar(),

          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/cover.jpg'),
                fit: BoxFit.cover
              )
            ),
          ),
          Center(
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5)
              ),
            )
          ),
          Center(
            child: Text("Practica 1", style: TextStyle(fontFamily: 'Signatra', fontSize: 60, color: Colors.white),),
          )
        ],
      ),
    );
  }
}