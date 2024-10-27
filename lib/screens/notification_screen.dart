import 'package:flutter/material.dart';
import '../widgets/notification_card.dart';

class NotificationsScreen extends StatelessWidget {
  // Datos de prueba
  final List<Map<String, String>> _notifications = [
    {
      'title': 'Actualización del sistema',
      'description': 'Se ha implementado una nueva actualización.',
      'imagePath': 'assets/images/logo.png',
    },
    {
      'title': 'Mantenimiento programado',
      'description': 'El sistema estará en mantenimiento el próximo lunes.',
      'imagePath': 'assets/images/logo.png',
    },
    {
      'title': 'Nueva funcionalidad',
      'description': 'Ahora puedes ver estadísticas detalladas.',
      'imagePath': 'assets/images/logo.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Notificaciones'),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _notifications.length,
          itemBuilder: (context, index) {
            final notification = _notifications[index];
            return NotificationCard(
              title: notification['title']!,
              description: notification['description']!,
              imagePath: notification['imagePath']!,
            );
          },
        ),
      ),
    );
  }
}
