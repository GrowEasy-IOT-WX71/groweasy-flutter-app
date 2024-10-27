import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({super.key});

  // Datos de prueba (en el futuro, se obtendrán de una API)
  final Map<String, String> profileData = {
    'name': 'Leonardo García',
    'email': 'leo@example.com',
    'phone': '+1 123 456 7890',
    'address': '123 Main St, New York, NY',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Perfil'),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/logo.png'), // Imagen de perfil de prueba
            ),
            const SizedBox(height: 16),
            Text(
              'Nombre:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              profileData['name']!,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Text(
              'Correo electrónico:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              profileData['email']!,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Text(
              'Teléfono:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              profileData['phone']!,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Text(
              'Dirección:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              profileData['address']!,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
