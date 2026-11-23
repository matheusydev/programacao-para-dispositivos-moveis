import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'TabBar para diferentes estados de tempo',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          ),
      ),
      home: const MyHomePage(
        title: 'TabBar Widget',
      ),
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class ConteudoTab extends StatelessWidget {
  const ConteudoTab({
    super.key,
    required this.imagem,
    required this.titulo,
    required this.descricao,
  });

  final String imagem;
  final String titulo;
  final String descricao;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(imagem, fit: BoxFit.cover),
          ),
          const SizedBox(height: 20),
          Text(
            titulo,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 12),
          Text(
            descricao,
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}

class TabNublado extends StatelessWidget {
  const TabNublado({super.key});

  @override
  Widget build(BuildContext context) {
    return const ConteudoTab(
      imagem: 'assets/images/nublado.png',
      titulo: 'O tempo está nublado por aqui',
      descricao:
          'O céu está coberto por nuvens e o sol aparece pouco. A temperatura '
          'fica mais amena e a luz do dia é mais suave. Mesmo sem chuva, vale '
          'levar um casaco leve, pois o tempo pode mudar ao longo do dia.',
    );
  }
}

class TabChuvoso extends StatelessWidget {
  const TabChuvoso({super.key});

  @override
  Widget build(BuildContext context) {
    return const ConteudoTab(
      imagem: 'assets/images/chuvoso.png',
      titulo: 'O tempo está chuvoso por aqui',
      descricao:
          'Há chuva com possibilidade de trovoadas. As ruas podem ficar '
          'molhadas e escorregadias, então leve guarda-chuva e capa de chuva. '
          'Evite áreas alagadas e procure abrigo durante os raios.',
    );
  }
}

class TabEnsolarado extends StatelessWidget {
  const TabEnsolarado({super.key});

  @override
  Widget build(BuildContext context) {
    return const ConteudoTab(
      imagem: 'assets/images/ensolarado.png',
      titulo: 'O tempo está ensolarado por aqui',
      descricao:
          'O dia está claro, com sol forte e céu azul. É um ótimo momento para '
          'atividades ao ar livre, mas não esqueça o protetor solar, use boné '
          'ou chapéu e beba bastante água para se manter hidratado.',
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          centerTitle: true,
          title: Text(widget.title,
          style: TextStyle(
          color: Colors.white,
        ),
      ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 4.0,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.cloud_outlined, color: Colors.white),
              ),
              Tab(
                icon: Icon(Icons.beach_access_sharp, color: Colors.white),
              ),
              Tab(
                icon: Icon(Icons.brightness_5_sharp, color: Colors.white),
              ),
            ],
          ),
    ),
    
    body: TabBarView(
      children: <Widget>[
        TabNublado(),
        TabChuvoso(),
        TabEnsolarado(),
      ],
    ),
      ),
    );
  }
}