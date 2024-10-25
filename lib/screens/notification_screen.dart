import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificaciones'),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: const Text(
          'Aquí aparecerán las notificaciones',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
