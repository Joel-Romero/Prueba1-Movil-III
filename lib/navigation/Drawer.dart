import 'package:flutter/material.dart';
import 'package:prueba_1/main.dart';
import 'package:prueba_1/screens/Ejercicio1.dart';
import 'package:prueba_1/screens/Ejercicio2.dart';
import 'package:prueba_1/screens/Ejercicio3.dart';


class MiDrawer extends StatelessWidget {
  const MiDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              children: [
                Expanded(
                  child: Image.network(
                    "https://images.pexels.com/photos/5184953/pexels-photo-5184953.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text("Ejercicio 1"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Ejercicio1()),
            ),
          ),
          
          ListTile(
            title: Text("Ejercicio 2"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Ejercicio2()),
            ),
          ),

          ListTile(
            title: Text("Ejercicio 3"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Ejercicio3()),
            ),
          ),

          ListTile(
            title: Text("Home"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            ),
          ),
        ],
      ),
    );
  }
}
