import 'package:flutter/material.dart';
import 'package:prueba_1/navigation/Drawer.dart';

class Ejercicio2 extends StatefulWidget {
  const Ejercicio2({super.key});

  @override
  State<Ejercicio2> createState() => _Ejercicio2State();
}

class _Ejercicio2State extends State<Ejercicio2> {
  String peso = '', 
  altura = '', 
  edad = '', 
  genero = 'hombre', 
  actividad = 'sedentario', 
  resultado = '';

  void calcularCalorias() {
    double? p = double.tryParse(peso), a = double.tryParse(altura);
    int? e = int.tryParse(edad);

    if (p == null || a == null || e == null) {
      setState(() => resultado = "Por favor ingresa todos los datos correctamente.");
      return;
    }

    double tmb = genero == 'hombre'
        ? 88.36 + 13.4 * p + 4.8 * a - 5.7 * e
        : 447.6 + 9.2 * p + 3.1 * a - 4.3 * e;

    double factor = {
      'sedentario': 1.2,
      'ligero': 1.375,
      'moderado': 1.55,
      'intenso': 1.725,
      'muy intenso': 1.9,
    }[actividad]!;

    setState(() => resultado = "Calorías diarias recomendadas: ${(tmb * factor).round()} kcal");
  }

  DropdownButton<String> crearDropdown(String value, List<String> items, void Function(String?) onChanged) =>
      DropdownButton(value: value, items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(), onChanged: onChanged);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        drawer: MiDrawer(),
        body: Column(
          children: [
            Text("Calculadora de Calorías Diarias"),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Peso (kg)'),
              onChanged: (v) => peso = v,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Altura (cm)'),
              onChanged: (v) => altura = v,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Edad'),
              onChanged: (v) => edad = v,
            ),
            crearDropdown(genero, ['hombre', 'mujer'], (v) => setState(() => genero = v!)),
            crearDropdown(actividad, ['sedentario', 'ligero', 'moderado', 'intenso', 'muy intenso'], (v) => setState(() => actividad = v!)),
            ElevatedButton(onPressed: calcularCalorias, child: Text("Calcular Calorías")),
            Text(resultado),
          ],
        ),
      );
}
