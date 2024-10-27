import 'package:flutter/material.dart';

class SensorConfigurationDialog extends StatefulWidget {
  final String sensorName;

  const SensorConfigurationDialog({super.key, required this.sensorName});

  @override
  _SensorConfigurationDialogState createState() =>
      _SensorConfigurationDialogState();
}

class _SensorConfigurationDialogState extends State<SensorConfigurationDialog> {
  double samplingInterval = 5.0;
  RangeValues temperatureRange = const RangeValues(10, 15);
  RangeValues alertThreshold = const RangeValues(5, 15);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        widget.sensorName,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            const SizedBox(height: 16),
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
            const SizedBox(height: 16),
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
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context), // Cierra el diálogo sin guardar
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            // Aquí puedes manejar el evento de actualización del sensor
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    'Parámetros del sensor ${widget.sensorName} actualizados'),
              ),
            );
            Navigator.pop(context); // Cierra el diálogo después de guardar
          },
          child: const Text('Guardar'),
        ),
      ],
    );
  }
}
