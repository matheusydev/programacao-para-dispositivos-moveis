import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class Item {
  String nome;
  bool chek;

  Item({required this.nome, required this.chek});
}

class HomePage extends StatefulWidget {
  final List<Item> items = [
    Item(nome: 'Arroz', chek: true),
    Item(nome: 'Feijao', chek: true),
    Item(nome: 'Farinha', chek: true),
    Item(nome: 'Leite', chek: false),
    Item(nome: 'Café', chek: false),
  ];

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;
    final total = widget.items.length;
    final marcados = widget.items.where((item) => item.chek).length;
    final progresso = total == 0 ? 0.0 : marcados / total;

    return Scaffold(
      backgroundColor: cores.surfaceContainerLowest,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: cores.primary,
        foregroundColor: cores.onPrimary,
        // menu IconButton no canto esquerdo do appBar
        leading: Center(
          child: CircleAvatar(
            radius: 18,
            backgroundColor: cores.onPrimary,
            child: Text(
              'OP',
              style: TextStyle(
                color: cores.primary,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
        ),
        title: const Text(
          'Home',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: const [
          // menu IconButton no canto direito do appBar
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.local_grocery_store),
          ),
        ],
      ),
      body: Column(
        children: [
          // Cabeçalho com o progresso da lista
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [cores.primary, cores.tertiary],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lista de Compras',
                  style: TextStyle(
                    color: cores.onPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$marcados de $total itens no carrinho',
                  style: TextStyle(color: cores.onPrimary.withOpacity(0.9)),
                ),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: progresso,
                    minHeight: 8,
                    backgroundColor: cores.onPrimary.withOpacity(0.3),
                    valueColor: AlwaysStoppedAnimation(cores.onPrimary),
                  ),
                ),
              ],
            ),
          ),

          // Lista de itens
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: widget.items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = widget.items[index]; // para evitar a repetição

                return Card(
                  key: Key(item.nome),
                  elevation: item.chek ? 0 : 2,
                  margin: const EdgeInsets.only(bottom: 10),
                  color: item.chek
                      ? cores.surfaceContainerHighest
                      : cores.surface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: CheckboxListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    checkboxShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    title: Text(
                      item.nome,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        decoration:
                            item.chek ? TextDecoration.lineThrough : null,
                        color: item.chek
                            ? cores.onSurface.withOpacity(0.5)
                            : cores.onSurface,
                      ),
                    ),
                    secondary: Icon(
                      item.chek
                          ? Icons.check_circle
                          : Icons.shopping_basket_outlined,
                      color: item.chek ? Colors.green : cores.primary,
                    ),
                    value: item.chek,
                    onChanged: (value) {
                      setState(() {
                        item.chek = value ?? false;
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}