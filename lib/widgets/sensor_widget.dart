import 'package:flutter/material.dart';

class SensorWidget extends StatelessWidget {
  final String title;
  final String status;
  final String imagePath;

  SensorWidget({
    required this.title,
    required this.status,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 250, // Ancho del widget
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start, // Alinear textos a la izquierda
          children: [
            // Imagen del sensor, con tamaño más grande
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                height: 200,
                imagePath, // Aumentar tamaño de la imagen
                width: double.infinity, // Ocupar todo el ancho disponible
                fit: BoxFit.contain, // Ajustar la imagen para que no pierda proporción
              ),
            ),
            Divider(color: Colors.grey), // Línea divisoria
            // Título del sensor
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            // Estado del sensor
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 9.0),
              child: Text(
                status,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.green, // Texto verde para "Funcionando"
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}