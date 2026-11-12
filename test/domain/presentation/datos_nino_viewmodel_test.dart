import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cars2_app/domain/entities/cars_tipos.dart';
import 'package:cars2_app/presentation/datos_nino/datos_nino_viewmodel.dart';

void main() {
  late ProviderContainer container;
  late DatosNinoViewModel vm;

  setUp(() {
    container = ProviderContainer();
    addTearDown(container.dispose);
    vm = container.read(datosNinoProvider.notifier);
  });

  test('al inicio los datos no son válidos', () {
    expect(container.read(datosNinoProvider).esValido, false);
    expect(vm.formularioRecomendado, isNull);
  });

  test('con edad, IQ y comunicación fluida recomienda HF', () {
    vm.cambiarEdad(8);
    vm.cambiarIq(95);
    vm.cambiarComunicacionFluida(true);
    expect(container.read(datosNinoProvider).esValido, true);
    expect(vm.formularioRecomendado, FormularioCars.hf);
  });

  test('un niño de 4 años recibe ST', () {
    vm.cambiarEdad(4);
    vm.cambiarIq(95);
    vm.cambiarComunicacionFluida(true);
    expect(vm.formularioRecomendado, FormularioCars.st);
  });

  test('un IQ negativo no es válido', () {
    vm.cambiarEdad(8);
    vm.cambiarIq(-5);
    vm.cambiarComunicacionFluida(true);
    expect(container.read(datosNinoProvider).esValido, false);
  });

  test(
    'con comunicación afectada recomienda ST aunque tenga edad e IQ altos',
    () {
      vm.cambiarEdad(8);
      vm.cambiarIq(95);
      vm.cambiarComunicacionFluida(false);
      expect(vm.formularioRecomendado, FormularioCars.st);
    },
  );
}
