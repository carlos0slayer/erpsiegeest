import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class EgresosEspecie extends StatefulWidget {
  @override
  _EgresosEspecieState createState() => _EgresosEspecieState();
}

class _EgresosEspecieState extends State<EgresosEspecie> {
  File _image;
  File _image2;
  File _image3;
  File _image4;

  Future _getImage() async {
    // ignore: deprecated_member_use
    File image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      this.setState(() {
        _image = image;
      });
    } else {
      this.setState(() {});
    }
  }

  Future _getImage2() async {
    // ignore: deprecated_member_use
    File image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      this.setState(() {
        _image2 = image;
      });
    } else {
      this.setState(() {});
    }
  }

  Future _getImage3() async {
    // ignore: deprecated_member_use
    File image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      this.setState(() {
        _image3 = image;
      });
    } else {
      this.setState(() {});
    }
  }

  Future _getImage4() async {
    // ignore: deprecated_member_use
    File image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      this.setState(() {
        _image4 = image;
      });
    } else {
      this.setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(30, 30, 46, 3),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(48, 109, 246, 3),
        title: Text(
          'Egreso en Especie',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
              child: Column(
            children: <Widget>[
              Divider(),
              _conceptoInput(),
              Divider(),
              _cantidadInput(),
              Divider(),
              _labelFotos(),
              _camaraInput(),
              Divider(),
              _observacionesInput(),
              Divider(),
              _submitInput(),
            ],
          )),
        ),
      ),
    );
  }

  Widget _conceptoInput() {
    return FadeInLeftBig(
      child: Container(
        child: TextFormField(
          style: TextStyle(color: Colors.white),
          autofocus: false,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(20.0)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromRGBO(48, 109, 246, 3), width: 2.0),
                borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Concepto en especie',
            hintStyle: TextStyle(color: Colors.white60),
            labelText: 'Concepto',
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            suffixIcon: Icon(
              FontAwesomeIcons.diceD6,
              color: Color.fromRGBO(48, 109, 246, 3),
            ),
          ),
          validator: (value) {
            if (value.length < 3) {
              return 'Porfavor Ingrese el Concepto';
            } else {
              return null;
            }
          },
        ),
      ),
    );
  }

  Widget _cantidadInput() {
    return FadeInRightBig(
      child: Container(
        child: TextFormField(
          style: TextStyle(color: Colors.white),
          autofocus: false,
          keyboardType: TextInputType.number,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(20.0)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromRGBO(48, 109, 246, 3), width: 2.0),
                borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Cantidad en unidad',
            hintStyle: TextStyle(color: Colors.white60),
            labelText: 'Cantidad de egreso en Especie',
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            suffixIcon: Icon(
              FontAwesomeIcons.sortNumericUp,
              color: Color.fromRGBO(48, 109, 246, 3),
            ),
          ),
          validator: (value) {
            if (value.length < 3) {
              return 'Porfavor Ingrese el Monto';
            } else {
              return null;
            }
          },
        ),
      ),
    );
  }

  Widget _labelFotos() {
    return BounceInDown(
      child: Container(
        width: 500.0,
        height: 60.0,
        child: Column(
          children: <Widget>[
            Icon(Icons.camera_alt, color: Colors.white),
            Text(
              'Fotografias de Evidencia',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _camaraInput() {
    return BounceInDown(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: 350,
              child: Text(
                '1: Foto Lugar De Alta',
                textAlign: TextAlign.left,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            Container(
              width: 350,
              child: Text(
                '2: Foto del Ingreso',
                textAlign: TextAlign.left,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            Container(
              width: 350,
              child: Text(
                '3: Foto De Implicados',
                textAlign: TextAlign.left,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            Container(
              width: 350,
              child: Text(
                '4: Foto Extra',
                textAlign: TextAlign.left,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            Divider(),
            GridView.count(
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.all(20.0),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              children: <Widget>[
                GestureDetector(
                  onTap: _getImage,
                  child: Container(
                    color: Color.fromRGBO(39, 41, 61, 3),
                    child: _image == null
                        ? Icon(
                            FontAwesomeIcons.plus,
                            color: Colors.white,
                          )
                        : Image.file(_image),
                  ),
                ),
                GestureDetector(
                  onTap: _getImage2,
                  child: Container(
                    color: Color.fromRGBO(39, 41, 61, 3),
                    child: _image2 == null
                        ? Icon(
                            FontAwesomeIcons.plus,
                            color: Colors.white,
                          )
                        : Image.file(_image2),
                  ),
                ),
                GestureDetector(
                  onTap: _getImage3,
                  child: Container(
                    color: Color.fromRGBO(39, 41, 61, 3),
                    child: _image3 == null
                        ? Icon(
                            FontAwesomeIcons.plus,
                            color: Colors.white,
                          )
                        : Image.file(_image3),
                  ),
                ),
                GestureDetector(
                  onTap: _getImage4,
                  child: Container(
                    color: Color.fromRGBO(39, 41, 61, 3),
                    child: _image4 == null
                        ? Icon(
                            FontAwesomeIcons.plus,
                            color: Colors.white,
                          )
                        : Image.file(_image4),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _observacionesInput() {
    return FadeInLeftBig(
      child: Container(
        child: TextFormField(
          style: TextStyle(color: Colors.white),
          autofocus: false,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(20.0)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromRGBO(48, 109, 246, 3), width: 2.0),
                borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Observaciones',
            hintStyle: TextStyle(color: Colors.white60),
            labelText: 'Observaciones',
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            suffixIcon: Icon(
              FontAwesomeIcons.solidEye,
              color: Color.fromRGBO(48, 109, 246, 3),
            ),
          ),
          validator: (value) {
            if (value.length < 3) {
              return 'Porfavor Ingrese alguna Observacion';
            } else {
              return null;
            }
          },
        ),
      ),
    );
  }

  Widget _submitInput() {
    return FadeInRightBig(
      child: Container(
        height: 50,
        width: 500,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: [
              Color.fromRGBO(30, 139, 248, 1),
              Color.fromRGBO(39, 115, 246, 1),
            ])),
        child: FlatButton(
          child: Text(
            "Registrar Ingreso",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          //onPressed: _submit,
        ),
      ),
    );
  }
}
