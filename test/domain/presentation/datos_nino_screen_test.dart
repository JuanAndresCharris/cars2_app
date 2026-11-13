import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cars2_app/presentation/datos_nino/datos_nino_screen.dart';

void main() {
  testWidgets('recomienda HF con edad 8, IQ 95 y comunicación fluida', (
    tester,
  ) async {
    await tester.pumpWidget(
      const ProviderScope(child: MaterialApp(home: DatosNinoScreen())),
    );

    await tester.enterText(find.byKey(const Key('campo_edad')), '8');
    await tester.enterText(find.byKey(const Key('campo_iq')), '95');
    await tester.tap(find.text('Fluida'));
    await tester.pump();

    expect(find.textContaining('CARS2-HF'), findsOneWidget);
  });

  testWidgets('no muestra recomendación si faltan datos', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: MaterialApp(home: DatosNinoScreen())),
    );

    expect(find.textContaining('CARS2-'), findsNothing);
  });

  testWidgets('al crear la sesión muestra su código', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: MaterialApp(home: DatosNinoScreen())),
    );

    await tester.enterText(find.byKey(const Key('campo_edad')), '8');
    await tester.enterText(find.byKey(const Key('campo_iq')), '95');
    await tester.tap(find.text('Fluida'));
    await tester.pump();
    await tester.tap(find.text('Crear sesión'));
    await tester.pumpAndSettle();

    expect(find.textContaining('Sesión creada: S-'), findsOneWidget);
  });
}
