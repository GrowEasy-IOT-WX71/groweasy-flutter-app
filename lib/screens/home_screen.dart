import 'package:flutter/material.dart';
import 'package:grow_easy_mobile_application/screens/sensor_configuration_screen.dart';
import 'package:grow_easy_mobile_application/widgets/navigation_bar_custom.dart';
import 'package:grow_easy_mobile_application/widgets/sensor_widget.dart';

// Simulación de datos que podrías obtener de una API
List<Map<String, String>> sensores = [
  {'name': 'Sensor de Temperatura', 'status': 'Funcionando', 'type': 'temperatura'},
  {'name': 'Sensor de Humedad', 'status': 'Niveles altos', 'type': 'humedad'},
  {'name': 'Sensor de PH', 'status': 'Desconectado', 'type': 'ph'},
  {'name': 'Sensor de Temperatura', 'status': 'Funcionando', 'type': 'temperatura'},
  {'name': 'Sensor de Humedad', 'status': 'Niveles bajos', 'type': 'humedad'},
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // En un futuro, estos datos vendrían de una API
  late List<Map<String, String>> sensorData;

  @override
  void initState() {
    super.initState();
    // Aquí simulas la asignación de datos desde una API
    sensorData = sensores;
  }

  // Función para determinar la imagen correcta según el tipo de sensor
  String _getImagePath(String sensorType) {
    switch (sensorType) {
      case 'temperatura':
        return 'assets/images/sensor_temperatura.png';
      case 'humedad':
        return 'assets/images/sensor_humedad.webp';
      case 'ph':
        return 'assets/images/sensor_ph.webp';
      default:
        return 'assets/images/default_sensor.png'; // Imagen por defecto si no se reconoce el tipo
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            const Text(
              'Lista de Sensores',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: sensorData.length,
                itemBuilder: (context, index) {
                  var sensor = sensorData[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SensorConfigurationScreen(
                            sensorName: sensor['name'] ?? 'Sensor Desconocido',
                          ),
                        ),
                      );
                    },
                    child: SensorWidget(
                      title: sensor['name'] ?? 'Sensor Desconocido',
                      status: sensor['status'] ?? 'Estado Desconocido',
                      imagePath: _getImagePath(sensor['type'] ?? 'default'),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
