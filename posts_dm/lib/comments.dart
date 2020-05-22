import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:posts_dm/globales.dart';

class Comments extends StatefulWidget {
  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  bool loading = true;

  //Link para obtener los comments desde Place Holder
  final String url =
      "https://jsonplaceholder.typicode.com/posts/" + idPost + "/comments";

  var client = http.Client();
  List<Comment> comment = List<Comment>();

  @override
  void initState() {
    fetchData();
    super.initState();
  }

//Lecutra del archivo json
  Future<void> fetchData() async {
    http.Response response = await client.get(url);
    if (response.statusCode == 200) {
      // Connection Ok
      List responseJson = json.decode(response.body);
      responseJson.map((m) => comment.add(new Comment.fromJson(m))).toList();
      setState(() {
        loading = false;
      });
    } else {
      throw ('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    //Widget que muestra el titulo del post dentro de un padding
    Widget nombrePost = Padding(
      padding: EdgeInsets.all(2.0),
      //Card para mostrar el post
      child: Card(
          color: Colors.blue[200],
          elevation: 5.0,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(8.0)),
          //formato con ListTile
          child: ListTile(
            title: Text(tituloPost,
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 25)),
          )),
    );

//Widget comments que enlista los comentarios esto dentro de un expanded
    Widget comments = Expanded(
        child: loading
            ? Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            //AquiListView se usa para enlistar los comments
            : ListView.builder(
                itemCount: comment.length,
                itemBuilder: (BuildContext context, int index) {
                  //Cada comment es un Card
                  return Card(
                    margin: EdgeInsets.all(5.0),
                    elevation: 3.0,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(8.0)),
                    //ListTile para darle formato a cada comment
                    child: ListTile(
                      title: Text(comment[index].body),
                      subtitle: Text(comment[index].name),
                      trailing: Icon(Icons.favorite),
                    ),
                  );
                },
              ));


    return Scaffold(
        appBar: AppBar(
          title: Text("Comments"),
          backgroundColor: Colors.blue,
        ),
        backgroundColor: Colors.blue[200],
        //Column para ordenar la pantalla de comments donde se muestra el titulo del post y sus comentarios debajo.
        body: Column(
          children: <Widget>[nombrePost, comments],
        ));
  }
}

//Clase comments con sus atributos
class Comment {
  int postId;
  int id;
  String name;
  String email;
  String body;

  Comment({this.postId, this.id, this.name, this.email, this.body});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
        postId: json['postId'],
        name: json['name'],
        email: json['email'],
        body: json['body']);
  }
}
