import 'package:flutter/material.dart';

import 'app.dart';
import 'firebase_setup.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ContatosApp(inicializacao: iniciarFirebase()));
}
