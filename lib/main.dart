import 'package:flutter/material.dart';
import 'package:prueba_1/navigation/Drawer.dart';
import 'package:prueba_1/screens/Ejercicio2.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Cuerpo(),
    );
  }
}

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  void _mostrarInformacion(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Ejercicios de Programación'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Programador: Joel Romero'),
              Text('Carrera: Desarrollo de Software'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Volver'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prueba 1"),
        actions: [
          IconButton(
            onPressed: () => _mostrarInformacion(context),
            icon: Icon(Icons.insert_drive_file_outlined),
          ),
        ],
      ),
      drawer: MiDrawer(),
    );
  }
}
