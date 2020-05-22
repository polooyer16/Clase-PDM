import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:posts_dm/comments.dart';
import 'package:posts_dm/globales.dart';
import 'package:posts_dm/posts.dart';
import 'package:http/http.dart' as http;

//Clase PostList StatefulWidget

class PostList extends StatefulWidget {
  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  //Link para obtener los posts, el cual esta alojado en git
  String url =
      "https://raw.githubusercontent.com/polooyer16/Clase-PDM/master/posts_dm/posts.json";

  Postss postss;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

//lectura del archivo json
  void fetchData() async {
    var response = await http.get(url);
    var decodedJson = jsonDecode(response.body);
    postss = Postss.fromJson(decodedJson);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0, //centrado del titulo en el AppBar
          centerTitle: true,
          title: Text(
            "PostApp",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          backgroundColor: Colors.blue,
        ),
        backgroundColor: Colors.grey[300],
        drawer: Drawer(),
        body: postss == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                //ListView nos sirve para enlistar los post
                children: postss.posts
                    .map((p) => Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: InkWell(
                              child: Hero(
                            tag: p.title,
                            //Cards para mostrar cada uno de los post con un diseño material
                            child: Card(
                                margin: EdgeInsets.all(2.0),
                                elevation: 3.0,
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(7.0)),
                                //EL ListTile nos sirve para darle cierto formato a nuestro post.
                                child: ListTile(
                                    /*con onTap cada vez que sea presionado un post se abrirar 
                                    la seccion con sus comentarios*/
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Comments()));
                                      //Asignacion de los valores de id y tiutlo a las variables globales
                                      idPost = p.id.toString();
                                      tituloPost = p.title;
                                    },
                                    //Infomacion obtenida de posts: title y body: 
                                    title: Text(
                                      p.title,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 20),
                                    ),
                                    subtitle: Text(p.body,
                                        style: TextStyle(
                                            color: Colors.grey[800],
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16)),
                                    trailing: Column(children: <Widget>[
                                      Icon(Icons.comment),
                                    ]))),
                          )),
                        ))
                    .toList()));
  }
}
