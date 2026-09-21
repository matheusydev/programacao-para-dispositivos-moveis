import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Banco App',

      // Tema do aplicativo
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),

      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior
      appBar: AppBar(
        title: const Text('Meu Banco'),
      ),

      // Barra lateral
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Cabeçalho do Drawer
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Foto de perfil
                  const CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.blue,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Nome
                  const Text(
                    'Otilio Paulo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // E-mail
                  const Text(
                    'professormaisgato@ifpi.edu',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            // Saldo
            ListTile(
              leading: const Icon(
                Icons.account_balance_wallet,
              ),
              title: const Text('Saldo'),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            // Extrato
            ListTile(
              leading: const Icon(
                Icons.receipt_long,
              ),
              title: const Text('Extrato'),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            // Pagamentos
            ListTile(
              leading: const Icon(
                Icons.payment,
              ),
              title: const Text('Pagamentos'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      // Corpo da aplicação
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(
              Icons.account_balance_wallet,
            ),
            title: Text('Saldo'),
            subtitle: Text('R\$ 1.500,00'),
          ),

          ListTile(
            leading: Icon(
              Icons.receipt_long,
            ),
            title: Text('Extrato'),
            subtitle: Text(
              'Visualize suas movimentações',
            ),
          ),

          ListTile(
            leading: Icon(
              Icons.payment,
            ),
            title: Text('Pagamentos'),
            subtitle: Text(
              'Consulte seus pagamentos',
            ),
          ),
        ],
      ),
    );
  }
}