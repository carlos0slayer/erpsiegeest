import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:siegeesterp/Animation/FadeAnimation.dart';
import 'package:siegeesterp/PagesAdmin/home_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({this.mimac});
  String mimac;
  @override
  _LoginPageState createState() => _LoginPageState();
}

String username = '';
String nombre = '';
String ciudad = '';
String apellidoMaterno = '';
String apellidoPaterno = '';
String fechaNacimiento = '';
String direccion = '';
String telefono = '';
String imagen = '';

class _LoginPageState extends State<LoginPage> {
  TextEditingController codigoAcceso = new TextEditingController();
  String msg = '';
  bool _keyboardState;

  /* Future<List> _login() async {
    final response = await http.post(
        "https://siegeest.app/enlaceSSP/php/loginapp.php",
        body: {"macAddress": widget.mimac, "codigoAcceso": codigoAcceso.text});

    var datauser = jsonDecode(response.body);
    if (datauser.length == 0) {
      setState(() {
        msg = 'Codigo No valido';
      });
    } else {
      if (datauser[0]['level'] == 'admin') {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomePage(
            nombre: nombre,
            ciudad: ciudad,
            username: username,
            apellidoMaterno: apellidoMaterno,
            apellidoPaterno: apellidoPaterno,
            fechaNacimiento: fechaNacimiento,
            direccion: direccion,
            telefono: telefono,
            imagen: imagen,
          ),
        ));
      } else if (datauser[0]['level'] == 'invitado') {}
      setState(() {
        nombre = datauser[0]['nombre'];
        ciudad = datauser[0]['ciudad'];
        username = datauser[0]['username'];
        apellidoPaterno = datauser[0]['apellidoPaterno'];
        apellidoMaterno = datauser[0]['apellidoMaterno'];
        fechaNacimiento = datauser[0]['fechaNacimiento'];
        direccion = datauser[0]['direccion'];
        telefono = datauser[0]['telefono'];
        imagen = datauser[0]['image'];
      });
    }

    return datauser;
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElasticIn(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/bgmaterialblack.png',
                      ),
                      fit: BoxFit.cover,
                      repeat: ImageRepeat.noRepeat)),
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 400,
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: FadeAnimation(
                              1.5,
                              SizedBox(
                                width: 70,
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 100),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/logoerp.png'))),
                                ),
                              )),
                        ),
                        Positioned(
                          child: FadeAnimation(
                              1.6,
                              Container(
                                margin: EdgeInsets.only(top: 100),
                                child: Center(
                                  child: Text(
                                    "Bienvenido",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        FadeAnimation(
                            1.8,
                            Container(
                              width: MediaQuery.of(context).size.width * 0.90,
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                    color: Colors.white10,
                                    blurRadius: 8.0,
                                    offset: Offset(0, 1))
                              ]),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(7),
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(39, 41, 61, 3),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: TextFormField(
                                      keyboardType: TextInputType.text,
                                      controller: codigoAcceso,
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Codigo de Acceso",
                                          suffixIcon: Icon(
                                            FontAwesomeIcons.code,
                                            color:
                                                Color.fromRGBO(39, 115, 246, 1),
                                            size: 18,
                                          ),
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        FadeAnimation(
                            2,
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.90,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(colors: [
                                    Color.fromRGBO(30, 139, 248, 1),
                                    Color.fromRGBO(39, 115, 246, 1),
                                  ])),
                              child: FlatButton(
                                child: Text(
                                  "Continuar",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  //_login();
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                  ));
                                },
                              ),
                            )),
                        Text(msg, style: TextStyle(color: Colors.red)),
                        SizedBox(
                          height: 70,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
