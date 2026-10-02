import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gasolina x Álcool',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      home: const MyHomePage(title: 'Gasolina x Álcool'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const String _urlImagem =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkUp608tYPVNiMo19eUyK8bfNxBRegf1mqeteGZaTb5_x2tpRTdJn6Qrs&s=10';

  static const Color _corAlcool = Color(0xFF2E9E4F);
  static const Color _corGasolina = Color(0xFFE8772E);

  final TextEditingController _controllerGasolina = TextEditingController();
  final TextEditingController _controllerAlcool = TextEditingController();

  double? _percentual;
  bool _abastecerAlcool = false;
  String? _erro;

  double? _converter(String texto) {
    return double.tryParse(texto.trim().replaceAll(',', '.'));
  }

  void _calcular() {
    FocusScope.of(context).unfocus();

    final double? gasolina = _converter(_controllerGasolina.text);
    final double? alcool = _converter(_controllerAlcool.text);

    setState(() {
      if (gasolina == null || alcool == null || gasolina <= 0) {
        _erro = 'Digite valores válidos nos dois campos';
        _percentual = null;
        return;
      }

      _erro = null;
      _percentual = alcool / gasolina * 100;
      _abastecerAlcool = _percentual! < 70;
    });
  }

  @override
  void dispose() {
    _controllerGasolina.dispose();
    _controllerAlcool.dispose();
    super.dispose();
  }

  Widget _campoValor({
    required TextEditingController controller,
    required String label,
    required Color cor,
  }) {
    return TextField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: label,
        prefixText: 'R\$ ',
        prefixIcon: Icon(Icons.local_gas_station, color: cor),
      ),
    );
  }

  Widget _cartaoResultado() {
    if (_erro != null) {
      return Text(
        _erro!,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.red),
      );
    }

    if (_percentual == null) {
      return const Text(
        'Preencha os valores e toque em Calcular',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black54),
      );
    }

    final Color cor = _abastecerAlcool ? _corAlcool : _corGasolina;
    final String combustivel = _abastecerAlcool ? 'álcool' : 'gasolina';

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cor.withOpacity(0.12),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cor, width: 2),
      ),
      child: Column(
        children: [
          Icon(Icons.local_gas_station, color: cor, size: 40),
          const SizedBox(height: 8),
          Text(
            'Abasteça com $combustivel',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: cor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'O álcool custa ${_percentual!.toStringAsFixed(1)}% do preço da gasolina',
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black87),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F6FB),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Qual compensa mais hoje?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(12),
              child: Image.network(
                _urlImagem,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.local_gas_station, size: 120),
              ),
            ),
            const SizedBox(height: 24),
            _campoValor(
              controller: _controllerGasolina,
              label: 'Valor da gasolina',
              cor: _corGasolina,
            ),
            const SizedBox(height: 12),
            _campoValor(
              controller: _controllerAlcool,
              label: 'Valor do álcool',
              cor: _corAlcool,
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: _calcular,
                icon: const Icon(Icons.calculate),
                label: const Text(
                  'Calcular',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 24),
            _cartaoResultado(),
          ],
        ),
      ),
    );
  }
}