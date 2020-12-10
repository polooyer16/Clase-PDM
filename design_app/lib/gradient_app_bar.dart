import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientAppBar extends StatelessWidget{
  final double barHeight = 60.0;
  double statusBarHeight = 0;
  @override
  Widget build(BuildContext context) {
    statusBarHeight = MediaQuery.of(context).padding.top;
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(top: statusBarHeight),
      height: barHeight + statusBarHeight,
      decoration: new BoxDecoration(
          color: Color(0xFF006CBD),
          gradient: LinearGradient(
              colors: [
                const Color(0xFF005CA1),
                const Color(0xFF008EFA)
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp
          )
      ),

    );
  }

}