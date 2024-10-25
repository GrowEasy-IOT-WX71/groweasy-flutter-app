import 'package:flutter/material.dart';
import 'package:grow_easy_mobile_application/screens/home_screen.dart';
import 'package:grow_easy_mobile_application/screens/notification_screen.dart';

class NavigationBarCustom extends StatefulWidget {
  const NavigationBarCustom({Key? key}) : super(key: key);

  @override
  _NavigationBarCustomState createState() => _NavigationBarCustomState();
}

class _NavigationBarCustomState extends State<NavigationBarCustom> {
  int _selectedIndex = 0; // Índice de la pestaña seleccionada

  // Lista de pantallas para navegar
  final List<Widget> _pages = [
    const HomeScreen(),
    NotificationsScreen(),
    const Center(child: Text('Perfil')), // Pantalla de ejemplo para el perfil
  ];

  // Método que maneja el cambio de la página seleccionada
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Cambia la pantalla mostrada según la pestaña seleccionada
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped, // Cambia la pantalla al seleccionar una opción
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications),
            label: 'Notificaciones',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_circle),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
