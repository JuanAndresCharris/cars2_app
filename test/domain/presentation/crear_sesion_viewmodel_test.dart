import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cars2_app/core/providers.dart';
import 'package:cars2_app/presentation/datos_nino/datos_nino_viewmodel.dart';

void main() {
  late ProviderContainer container;
  late DatosNinoViewModel vm;

  setUp(() {
    container = ProviderContainer();
    addTearDown(container.dispose);
    vm = container.read(datosNinoProvider.notifier);
  });

  test('con datos válidos crea la sesión y la deja como actual', () async {
    vm.cambiarEdad(8);
    vm.cambiarIq(95);
    vm.cambiarComunicacionFluida(true);

    final sesion = await vm.crearSesion();

    expect(sesion, isNotNull);
    expect(container.read(sesionActualProvider)?.id, sesion!.id);
  });

  test('sin datos válidos no crea ninguna sesión', () async {
    final sesion = await vm.crearSesion();

    expect(sesion, isNull);
    expect(container.read(sesionActualProvider), isNull);
  });
}
