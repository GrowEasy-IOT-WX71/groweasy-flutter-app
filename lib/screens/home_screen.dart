import 'package:flutter/material.dart';
import 'package:grow_easy_mobile_application/widgets/sensor_widget.dart';

class HomeScreen extends StatefulWidget {
  // Variable que controla la cantidad de widgets a renderizar
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int cantidadDeWidgets = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      //appbar
      appBar: AppBar(
        title: const Text(
          'GrowEasy',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.white,
      ),

      backgroundColor: Colors.white,


      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // Título agregado antes de los widgets dinámicos
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Lista de Sensores',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cantidadDeWidgets,
                // Controla la cantidad de widgets a mostrar
                itemBuilder: (context, index) {
                  return SensorWidget(
                      title: 'Sensor de Temperatura',
                      status: 'Funcionando',
                      imagePath: 'assets/images/sensor_temperatura.png');
                },
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notificaciones',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
