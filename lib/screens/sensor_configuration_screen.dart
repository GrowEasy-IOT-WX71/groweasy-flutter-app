import 'package:flutter/material.dart';

class SensorConfigurationScreen extends StatefulWidget {
  final String sensorName;

  const SensorConfigurationScreen({super.key, required this.sensorName});

  @override
  _SensorConfigurationScreenState createState() =>
      _SensorConfigurationScreenState();
}

class _SensorConfigurationScreenState extends State<SensorConfigurationScreen> {
  double samplingInterval = 5.0;
  RangeValues temperatureRange = const RangeValues(10, 15);
  RangeValues alertThreshold = const RangeValues(5, 15);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widget.sensorName,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),

            const Text(
              'Intervalo de muestreo (minutos)',
              style: TextStyle(fontSize: 18),
            ),
            Slider(
              value: samplingInterval,
              min: 0,
              max: 10,
              divisions: 5,
              label: '${samplingInterval.toInt()}m',
              onChanged: (double value) {
                setState(() {
                  samplingInterval = value;
                });
              },
            ),
            const Text(
              'Rango de temperatura (°C)',
              style: TextStyle(fontSize: 18),
            ),
            RangeSlider(
              values: temperatureRange,
              min: 0,
              max: 20,
              divisions: 4,
              labels: RangeLabels(
                '${temperatureRange.start}°',
                '${temperatureRange.end}°',
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  temperatureRange = values;
                });
              },
            ),
            const Text(
              'Umbrales de alerta (°C)',
              style: TextStyle(fontSize: 18),
            ),
            RangeSlider(
              values: alertThreshold,
              min: 0,
              max: 20,
              divisions: 4,
              labels: RangeLabels(
                '${alertThreshold.start}°',
                '${alertThreshold.end}°',
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  alertThreshold = values;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aquí puedes manejar el evento de actualización del sensor
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  'Parámetros del sensor ${widget.sensorName} actualizados'),
            ),
          );
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
