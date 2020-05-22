import 'package:flutter/material.dart';
import 'package:posts_dm/posts_list.dart';
   void main(){
     //Metodo main que manda llmar a PostList
  runApp(MaterialApp(
    title: "Posts",
    home: PostList(),
    debugShowCheckedModeBanner: false,
  ));
}