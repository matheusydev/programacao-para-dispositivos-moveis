import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

Future<void> iniciarFirebase() async {
  const usarEmuladores = bool.fromEnvironment('FIREBASE_EMULATORS');
  if (usarEmuladores) {
    await Firebase.initializeApp(
      name: '[DEFAULT]',
      demoProjectId: 'demo-atividade-9',
    );
  } else {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  final auth = FirebaseAuth.instance;
  if (usarEmuladores) {
    const host = '127.0.0.1';
    await auth.useAuthEmulator(host, 9099);
    FirebaseFirestore.instance.useFirestoreEmulator(host, 8080);
  }

  final usuario = await auth.authStateChanges().first;
  if (usuario == null) {
    await auth.signInAnonymously();
  }
}
