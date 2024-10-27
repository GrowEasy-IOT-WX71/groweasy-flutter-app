import 'package:flutter/material.dart';
import 'package:grow_easy_mobile_application/widgets/sensor_configuration.dart';
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
  late List<Map<String, String>> sensorData;

  @override
  void initState() {
    super.initState();
    sensorData = sensores;
  }

  String _getImagePath(String sensorType) {
    switch (sensorType) {
      case 'temperatura':
        return 'assets/images/sensor_temperatura.png';
      case 'humedad':
        return 'assets/images/sensor_humedad.webp';
      case 'ph':
        return 'assets/images/sensor_ph.webp';
      default:
        return 'assets/images/default_sensor.png';
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
                      showDialog(
                        context: context,
                        builder: (context) => SensorConfigurationDialog(
                          sensorName: sensor['name'] ?? 'Sensor Desconocido',
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
