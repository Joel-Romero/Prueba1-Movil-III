import 'package:flutter/material.dart';
import 'package:prueba_1/navigation/Drawer.dart';

class Ejercicio3 extends StatefulWidget {
  const Ejercicio3({super.key});

  @override
  State<Ejercicio3> createState() => _Ejercicio3State();
}

class _Ejercicio3State extends State<Ejercicio3> {
  String distancia = '', eficiencia = '', precio = '';
  double? costoTotal;

  void calcularCosto() {
    double? d = double.tryParse(distancia);
    double? e = double.tryParse(eficiencia);
    double? p = double.tryParse(precio);

    if (d != null && e != null && p != null && e > 0) {
      setState(() => costoTotal = (d / e) * p);
    } else {
      setState(() => costoTotal = null);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ingresa valores válidos (eficiencia > 0).')),
      );
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text("Ejercicio 3")),
        drawer: MiDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Distancia del viaje (km)'),
                onChanged: (v) => distancia = v,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Eficiencia del auto (km/litro)'),
                onChanged: (v) => eficiencia = v,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Precio por litro de combustible'),
                onChanged: (v) => precio = v,
              ),
              ElevatedButton(
                onPressed: calcularCosto,
                child: Text('Calcular'),
              ),
              if (costoTotal != null)
                Text('Costo total del viaje: \$${costoTotal!.toStringAsFixed(2)}'),
            ],
          ),
        ),
      );
}
