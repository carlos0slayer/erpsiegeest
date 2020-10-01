import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:siegeesterp/PagesAdmin/HomePageResources/animated_bootom_bar.dart';
import 'package:siegeesterp/PagesAdmin/indexPage.dart';
import 'package:siegeesterp/PagesAdmin/notificationPage.dart';
import 'package:siegeesterp/PagesAdmin/profilePage.dart';

class HomePage extends StatefulWidget {
  HomePage(
      {this.nombre,
      this.ciudad,
      this.username,
      this.apellidoPaterno,
      this.apellidoMaterno,
      this.fechaNacimiento,
      this.direccion,
      this.telefono,
      this.imagen});
  String nombre;
  String ciudad;
  String username;
  String apellidoPaterno;
  String apellidoMaterno;
  String fechaNacimiento;
  String direccion;
  String telefono;
  String imagen;
  final List<BarItem> barItems = [
    BarItem(
      text: "Inicio",
      iconos: FontAwesomeIcons.home,
      color: Color.fromRGBO(48, 109, 246, 3),
    ),
    BarItem(
        text: "Notificaciones",
        iconos: FontAwesomeIcons.bell,
        color: Color.fromRGBO(178, 0, 98, 1)),
    BarItem(
        text: "Mi Perfil",
        iconos: FontAwesomeIcons.user,
        color: Color.fromRGBO(15, 230, 198, 3)),
  ];

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedBarIndex = 0;

  //Paginas
  final IndexPageHome _indexPage = IndexPageHome();
  final NotificacionesPage _paginaNotificaciones = NotificacionesPage();
  final PerfilPage _paginaPerfil = PerfilPage();

  Widget _showPage = new IndexPageHome();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _indexPage;
        break;
      case 1:
        return _paginaNotificaciones;
        break;
      case 2:
        return _paginaPerfil;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(30, 30, 46, 3),
      body: AnimatedContainer(
        child: _showPage,
        duration: const Duration(milliseconds: 700),
      ),
      bottomNavigationBar: AnimatedBottomBar(
        barItems: widget.barItems,
        animationDuration: const Duration(milliseconds: 550),
        onBarTap: (index) {
          setState(() {
            _showPage = _pageChooser(index);
          });
        },
      ),
    );
  }

  static IndexPage() {}
}
