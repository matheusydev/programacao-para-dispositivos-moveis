import 'package:flutter/material.dart';

import 'simple_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: buildBoldAppBar('Profile'),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24),
        children: [
          const Center(
            child: CircleAvatar(
              radius: 48,
              backgroundColor: Color(0xFFFFE082),
              child: Icon(Icons.person, size: 56, color: Colors.black87),
            ),
          ),
          const SizedBox(height: 12),
          const Center(
            child: Text(
              ' Otilio Paulo',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 4),
          Center(
            child: Text(
              'Professor - IFPI',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
          ),
          const SizedBox(height: 24),
          const ListTile(
            leading: Icon(Icons.settings_outlined),
            title: Text('Configurações'),
          ),
          const ListTile(
            leading: Icon(Icons.notifications_outlined),
            title: Text('Notificações'),
          ),
          const ListTile(
            leading: Icon(Icons.help_outline),
            title: Text('Ajuda'),
          ),
          const ListTile(leading: Icon(Icons.logout), title: Text('Sair')),
        ],
      ),
    );
  }
}
