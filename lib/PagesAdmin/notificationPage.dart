import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:siegeesterp/Animation/FadeAnimation.dart';

class NotificacionesPage extends StatefulWidget {
  @override
  _NotificacionesPageState createState() => _NotificacionesPageState();
}

class _NotificacionesPageState extends State<NotificacionesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(30, 30, 46, 3),
      body: JelloIn(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.43,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color.fromRGBO(178, 0, 98, .7),
                    Color.fromRGBO(178, 0, 98, 1),
                  ])),
                  child: Container(
                    margin: EdgeInsets.only(right: 40, top: 20, bottom: 20),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/diamantetr.png'),
                            fit: BoxFit.contain)),
                  ),
                )
              ],
            ),
            FadeAnimation(
              .7,
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Notificaciones",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 1,
                      childAspectRatio: 1.7,
                      children: <Widget>[
                        categoryWidget(
                            'conexion',
                            "Ingreso en efectivo agregado con exito.",
                            "Folio: FFJ39HZZ",
                            "Fecha:07/09/2020 \n Hora: 11:43 a.m."),
                        categoryWidget2('conexion',
                            "Sin Conexion, en espera para subir registros"),
                        categoryWidget(
                            'beneficiario2',
                            "Ingreso en efectivo agregado con exito.",
                            "Folio: RRPFA46G7",
                            "Fecha:07/09/2020 \n Hora: 11:43 a.m."),
                        categoryWidget(
                            'conexion',
                            "Ingreso en efectivo agregado con exito.",
                            "Folio: FFJ39HZZ",
                            "Fecha:07/09/2020 \n Hora: 11:43 a.m."),
                        categoryWidget2('conexion',
                            "Sin Conexion, en espera para subir registros"),
                        categoryWidget(
                            'beneficiario2',
                            "Ingreso en efectivo agregado con exito.",
                            "Folio: RRPFA46G7",
                            "Fecha:07/09/2020 \n Hora: 11:43 a.m."),
                        categoryWidget(
                            'conexion',
                            "Ingreso en efectivo agregado con exito.",
                            "Folio: FFJ39HZZ",
                            "Fecha:07/09/2020 \n Hora: 11:43 a.m."),
                        categoryWidget2('conexion',
                            "Sin Conexion, en espera para subir registros"),
                        categoryWidget(
                            'beneficiario2',
                            "Ingreso en efectivo agregado con exito.",
                            "Folio: RRPFA46G7",
                            "Fecha:07/09/2020 \n Hora: 11:43 a.m."),
                        categoryWidget(
                            'conexion',
                            "Ingreso en efectivo agregado con exito.",
                            "Folio: FFJ39HZZ",
                            "Fecha:07/09/2020 \n Hora: 11:43 a.m."),
                        categoryWidget2('conexion',
                            "Sin Conexion, en espera para subir registros"),
                        categoryWidget(
                            'beneficiario2',
                            "Ingreso en efectivo agregado con exito.",
                            "Folio: RRPFA46G7",
                            "Fecha:07/09/2020 \n Hora: 11:43 a.m."),
                        categoryWidget(
                            'conexion',
                            "Ingreso en efectivo agregado con exito.",
                            "Folio: FFJ39HZZ",
                            "Fecha:07/09/2020 \n Hora: 11:43 a.m."),
                        categoryWidget2('conexion',
                            "Sin Conexion, en espera para subir registros"),
                        categoryWidget(
                            'beneficiario2',
                            "Ingreso en efectivo agregado con exito.",
                            "Folio: RRPFA46G7",
                            "Fecha:07/09/2020 \n Hora: 11:43 a.m."),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Card categoryWidget(String img, String title, String bodyText, String time) {
    return Card(
      color: Color.fromRGBO(30, 30, 46, 3),
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: EdgeInsets.all(18.0),
      child: InkWell(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 1,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                '$title',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
                child: Text(
              bodyText,
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
              textAlign: TextAlign.start,
            )),
            Expanded(
                child: Text(
              time,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
              textAlign: TextAlign.start,
            )),
          ],
        ),
      ),
    );
  }

  Card categoryWidget2(String img, String title) {
    return Card(
      color: Color.fromRGBO(30, 30, 46, 3),
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
      child: InkWell(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/$img.png'),
                        fit: BoxFit.contain)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                '$title',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  void openProductPage(String img, String title, String bodyText, String time) {
    Navigator.pushNamed(context, '/productPage', arguments: {
      'image': '$img',
      'title': '$title',
      'body': '$bodyText',
      'time': '$time'
    });
  }
}
