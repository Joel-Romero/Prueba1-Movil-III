import 'package:flutter/material.dart';
import 'package:prueba_1/navigation/Drawer.dart';
import 'dart:math';

class Ejercicio1 extends StatefulWidget {
  const Ejercicio1({super.key});

  @override
  State<Ejercicio1> createState() => _Ejercicio1State();
}

class _Ejercicio1State extends State<Ejercicio1> {
  String masaTexto = "";
  String velocidadTexto = "";
  String _resultado = "";

  void _calcularEnergia() {
    double? masa = double.tryParse(masaTexto);
    double? velocidad = double.tryParse(velocidadTexto);

    if (masa == null || masa < 0 || velocidad == null || velocidad < 0) {
      setState(() {
        _resultado = "Ingrese valores válidos y positivos.";
      });
      return;
    }

    if (velocidad == 0) {
      setState(() {
        _resultado = "El objeto está en reposo (energía = 0).";
      });
    } else {
      double energia = 0.5 * masa * pow(velocidad, 2);
      setState(() {
        _resultado =
            "La energía cinética del objeto es: ${energia.toStringAsFixed(2)} J";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ejercicio 1")),
      drawer: MiDrawer(),
      body: Column(
        children: [
          Text("Calcular de Energía Cinética"),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Masa (kg)"),
            onChanged: (valor) {
              masaTexto = valor;
            },
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Velocidad (m/s)"),
            onChanged: (valor) {
              velocidadTexto = valor;
            },
          ),
          ElevatedButton(
            onPressed: _calcularEnergia,
            child: Text("Calcular Energía Cinética"),
          ),
          Text(_resultado),
        ],
      ),
    );
  }
}
