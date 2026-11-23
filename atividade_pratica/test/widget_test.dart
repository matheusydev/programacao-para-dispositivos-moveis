import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:atividade_pratica/main.dart';

void main() {
  testWidgets('Discovery mostra os 6 cards e navega', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Discovery'), findsOneWidget);
    for (final title in [
      'Bars & Hotels',
      'Fine Dining',
      'Cafes',
      'Nearby',
      'Fast Foods',
      'Featured Foods',
    ]) {
      expect(find.text(title), findsOneWidget);
    }
    expect(find.text('5 Places'), findsOneWidget);

    await tester.tap(find.text('Cafes'));
    await tester.pumpAndSettle();
    expect(find.text('Oca Cafeteria'), findsOneWidget);

    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(find.text('Discovery'), findsOneWidget);
  });

  testWidgets('Item (d): barra inferior troca de aba', (tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byIcon(Icons.search));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'oca');
    await tester.pump();
    expect(find.text('Oca Cafeteria'), findsOneWidget);
    expect(find.text('Clean Café'), findsNothing);

    await tester.tap(find.byIcon(Icons.emoji_events_outlined));
    await tester.pumpAndSettle();
    expect(find.text('1'), findsOneWidget);
    expect(find.text('Theatro 4 de Setembro'), findsOneWidget);
    expect(find.text('4.8'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.bookmark_border));
    await tester.pumpAndSettle();
    expect(find.text('Seus locais salvos aparecerão aqui.'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.person_outline));
    await tester.pumpAndSettle();
    expect(find.text('Professor - IFPI'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.home_outlined));
    await tester.pumpAndSettle();
    expect(find.text('Discovery'), findsOneWidget);
  });
}
