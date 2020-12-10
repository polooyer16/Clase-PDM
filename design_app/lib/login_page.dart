import 'package:design_app/place_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'gradient_app_bar.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _user;
  String _password;
  final formkey = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Color(0xFFF3F3F3),
        key: scaffoldkey,
        body: Column(children: <Widget>[
          GradientAppBar(),
          Expanded(
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: <Widget>[
                      Center(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              //Center Row contents horizontally,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 40, left: 18),
                              child: Image.asset(
                                'assets/img/logoag.png',
                                height: 100,
                                width: 100,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 55, left: 18, right: 18),
                              child: Text("Consulting \n App",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black54))),
                            ),
                          ])),
                      Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: Text(
                          "Bienvenido",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.blue[500],
                              fontSize: 24,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Form(
                          key: formkey,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 30, left: 5, right: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                        width: 300,
                                        child: Material(

                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40)),
                                            color: Colors.white,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.all(12.0),
                                                  child: Icon(
                                                    Icons.account_circle,
                                                    color: Colors.black38,
                                                  ),
                                                ),
                                                Container(
                                                  width: 250,
                                                  height: 55,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(40),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          40))),
                                                  child: Padding(
                                                    padding: EdgeInsets.all(8),
                                                    child: TextFormField(
                                                      validator: (value) => value
                                                              .isEmpty
                                                          ? "Usuario es obligatorio"
                                                          : null,
                                                      onSaved: (value) =>
                                                          _user = value,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.black),
                                                      decoration:
                                                          InputDecoration(
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              hintText:
                                                                  "Usuario",
                                                              fillColor:
                                                                  Colors.white,
                                                              filled: true),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )))
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 16, left: 8, right: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                        width: 300,
                                        child: Material(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40)),
                                            color: Colors.white,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.all(12.0),
                                                  child: Icon(
                                                    Icons.vpn_key_rounded,
                                                    color: Colors.black45,
                                                  ),
                                                ),
                                                Container(
                                                  width: 250,
                                                  height: 55,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(40),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          40))),
                                                  child: Padding(
                                                    padding: EdgeInsets.all(8),
                                                    child: TextFormField(
                                                      obscureText: true,
                                                      validator: (value) => value
                                                              .toString()
                                                              .isEmpty
                                                          ? "Contraseña es obligatoria"
                                                          : null,
                                                      onSaved: (value) =>
                                                          _password = value,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.black),
                                                      decoration:
                                                          InputDecoration(
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              hintText:
                                                                  "Contraseña",
                                                              fillColor:
                                                                  Colors.white,
                                                              filled: true),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )))
                                  ],
                                ),
                              ),
                            ],
                          )),
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 40, right: 40),
                        child: Container(
                            width: 300,
                            height: 95,
                            padding: EdgeInsets.all(20),
                            child:  RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35.0)),
                              onPressed: () {
                                final form = formkey.currentState;
                                if (form.validate()) {
                                  form.save();
                                  if (_user == "alejandro" &&
                                      _password == "soto123") {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => PlacePage()));
                                  } else {
                                    scaffoldkey.currentState
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                          "Usuario y/o contraseña incorrecta!"),
                                    ));
                                  }
                                }
                                //Para sacar la última ruta:  Navigator.pop(context);
                              },
                              elevation: 5,
                              color: Color(0xFF005CA1),
                              child: Text(
                                "Iniciar Sesión",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500)),
                              ),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 0, left: 40, right: 40),
                        child: Container(
                            width: 300,
                            height: 95,
                            padding: EdgeInsets.all(20),
                            child:  RaisedButton.icon(
                              icon: Image.asset('assets/img/iconog.png',
                                height: 30,
                                width: 30,),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35.0)),
                              onPressed: () {
                              },
                              elevation: 5,
                              color: Colors.white,
                              label: Text(
                                "Google",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600)),
                              ),

                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: Text(
                          "Crear una cuenta",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.blue[500],
                              fontSize: 24,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  )))
        ]));
  }
}
