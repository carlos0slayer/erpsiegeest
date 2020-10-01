import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class IngresarResponsable extends StatefulWidget {
  @override
  _IngresarResponsableState createState() => _IngresarResponsableState();
}

class _IngresarResponsableState extends State<IngresarResponsable> {
  File _image;
  File _image2;
  File _image3;
  File _image4;
  File pickedImage;
  var curp = '';
  String validacionFinal = '';
  String validacionCurp = '';
  String completarInputs = '';
  TextEditingController _obtenercurp = new TextEditingController();

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

  Future pickImage() async {
    // ignore: deprecated_member_use
    File awaitImage = await ImagePicker.pickImage(source: ImageSource.camera);
    if (awaitImage != null) {
      this.setState(() {
        pickedImage = awaitImage;
      });
    }
    FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(pickedImage);
    TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();
    VisionText visionText = await textRecognizer.processImage(visionImage);

    String curpIne = r'([A-Z]+[0-9]+[A-Z]{6})';
    RegExp regEx = RegExp(curpIne);
    for (TextBlock block in visionText.blocks) {
      for (TextLine line in block.lines) {
        if (regEx.hasMatch(line.text)) {
          curpIne = line.text;
          setState(() {
            curp = curpIne;
            _obtenercurp.text = curp.substring(5, 23);
            validacionCurp = _obtenercurp.text;
          });
        }
      }
    }
    textRecognizer.close();
    void curpValidada(curp) {
      var re =
          r'/^([A-Z][AEIOUX][A-Z]{2}\d{2}(?:0\d|1[0-2])(?:[0-2]\d|3[01])[HM](?:AS|B[CS]|C[CLMSH]|D[FG]|G[TR]|HG|JC|M[CNS]|N[ETL]|OC|PL|Q[TR]|S[PLR]|T[CSL]|VZ|YN|ZS)[B-DF-HJ-NP-TV-Z]{3}[A-Z\d])(\d)$/';
      var validado = curp.match(re);
    }
  }

  String _seleccionNivelUsuario = 'Invitado';
  String _nivelUsuarioValue;
  List<String> _nivelUsuario = ['Administrador', 'Responsable', 'Invitado'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(30, 30, 46, 3),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(48, 109, 246, 3),
        title: Text(
          'Egreso en Flujo de Efectivo',
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
              _labelDatos(),
              _capturarCurp(),
              _labelCurp(),
              _curpInput(),
              _labelBerificacionCurp(),
              Divider(),
              _userNameInput(),
              Divider(),
              _nivelLabel(),
              _nivelInput(),
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

  Widget _labelDatos() {
    return Container(
      child: Text(
        "Datos del Responsable",
        style: TextStyle(
            color: Color.fromRGBO(48, 109, 246, 3),
            fontSize: 20,
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      width: 300.0,
      height: 35.0,
    );
  }

  Widget _labelCurp() {
    return Container(
      child: curp == ''
          ? Text(
              "Porfavor Capture el INE del Responsable",
              style: TextStyle(
                  color: Color.fromRGBO(48, 109, 246, 3),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )
          : Text(
              "INE capturada",
              style: TextStyle(
                  color: Color.fromRGBO(48, 109, 246, 3),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
      width: 300.0,
      height: 35.0,
    );
  }

  Widget _capturarCurp() {
    return Container(
      padding: EdgeInsets.all(20),
      child: GestureDetector(
        onTap: pickImage,
        child: Container(
          padding: EdgeInsets.all(5),
          color: Color.fromRGBO(48, 109, 246, 3),
          child: pickedImage == null
              ? Icon(
                  FontAwesomeIcons.plus,
                  color: Colors.white,
                  size: 50,
                )
              : Image.file(
                  pickedImage,
                  width: 130,
                ),
        ),
      ),
    );
  }

  Widget _labelBerificacionCurp() {
    return Container(
      child: curp == ''
          ? Text(
              "Esperando CURP...",
              style: TextStyle(
                  color: Color.fromRGBO(48, 109, 246, 3),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )
          : Text(
              "Verifique que la CURP se alla escaneado correctamente o modifiquela",
              style: TextStyle(
                  color: Color.fromRGBO(48, 109, 246, 3),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
      width: 300.0,
      height: 55.0,
      padding: EdgeInsets.only(top: 10),
    );
  }

  Widget _curpInput() {
    return Container(
      child: TextFormField(
        style: TextStyle(
          color: Colors.white,
        ),
        autofocus: false,
        //initialValue: curp.substring(5, 23),
        controller: _obtenercurp,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromRGBO(48, 109, 246, 3), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          hintText: 'CURP del Responsable',
          hintStyle: TextStyle(color: Colors.white60),
          labelText: 'CURP',
          labelStyle: TextStyle(
            color: Colors.white,
          ),
          suffixIcon: Icon(
            FontAwesomeIcons.idCard,
            color: Color.fromRGBO(48, 109, 246, 3),
          ),
        ),
        validator: (value) {
          if (value.length < 3) {
            return 'Porfavor Ingrese la CURP';
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget _userNameInput() {
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
            hintText: 'Ejemplo: carlos@siegeest.app',
            hintStyle: TextStyle(color: Colors.white60),
            labelText: 'Nombre de Usuario',
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            suffixIcon: Icon(
              FontAwesomeIcons.userAlt,
              color: Color.fromRGBO(48, 109, 246, 3),
            ),
          ),
          validator: (value) {
            if (value.length < 3) {
              return 'Porfavor Ingrese el Nombre de Usuario';
            } else {
              return null;
            }
          },
        ),
      ),
    );
  }

  Widget _nivelLabel() {
    return Container(
      child: Text(
        "Seleccione el Nivel de Usuario",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        textAlign: TextAlign.center,
      ),
      width: 300.0,
      height: 35.0,
    );
  }

  Widget _nivelInput() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(
          FontAwesomeIcons.users,
          color: Color.fromRGBO(48, 109, 246, 3),
        ),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton<String>(
                dropdownColor: Color.fromRGBO(39, 41, 61, 3),
                value: _seleccionNivelUsuario,
                iconSize: 30.0,
                icon: (null),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                hint: Text("Selecciona una Opcion"),
                onChanged: (opt) {
                  setState(() {
                    _seleccionNivelUsuario = opt;
                    _nivelUsuarioValue = _seleccionNivelUsuario;
                  });
                },
                items: getOpcionesNivel(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> getOpcionesNivel() {
    List<DropdownMenuItem<String>> lista = new List();
    _nivelUsuario.forEach((nivel) {
      lista.add(DropdownMenuItem(
        child: Text(nivel),
        value: nivel,
      ));
    });
    return lista;
  }

  Widget _telefonoInput() {
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
            hintText: 'Cantidad en Pesos',
            hintStyle: TextStyle(color: Colors.white60),
            labelText: 'Cantidad de egreso en Efectivo',
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
