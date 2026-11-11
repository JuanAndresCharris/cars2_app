import 'package:flutter_test/flutter_test.dart';
import 'package:cars2_app/domain/entities/cars_tipos.dart';
import 'package:cars2_app/domain/services/reglas_cars.dart';

void main() {
  final reglas = ReglasCars();

  // Casos del manual
  final michael = [
    3,
    3,
    2,
    1.5,
    3.5,
    3,
    3,
    2,
    1,
    1,
    2.5,
    3,
    2,
    3,
    3,
  ].map((e) => e.toDouble()).toList();
  final daniel = [
    3,
    2.5,
    2,
    3,
    3,
    2,
    2,
    1,
    2,
    2.5,
    3,
    2,
    3,
    3,
    3,
  ].map((e) => e.toDouble()).toList();

  group('puntajeTotal', () {
    test('Michael suma 36,5', () => expect(reglas.puntajeTotal(michael), 36.5));
    test('Daniel suma 37', () => expect(reglas.puntajeTotal(daniel), 37));
    test(
      'rechaza menos de 15 ítems',
      () => expect(() => reglas.puntajeTotal([1, 2]), throwsArgumentError),
    );
    test('rechaza valores fuera de escala', () {
      final mala = List<double>.filled(15, 1)..[0] = 1.2;
      expect(() => reglas.puntajeTotal(mala), throwsArgumentError);
    });
  });

  group('categoria', () {
    test('Michael (ST, 4 años) es leve a moderada', () {
      expect(
        reglas.categoria(
          formulario: FormularioCars.st,
          puntajeTotal: 36.5,
          edadAnios: 4,
        ),
        CategoriaSeveridad.leveModerada,
      );
    });
    test('Daniel (HF) es severa', () {
      expect(
        reglas.categoria(
          formulario: FormularioCars.hf,
          puntajeTotal: 37,
          edadAnios: 8,
        ),
        CategoriaSeveridad.severa,
      );
    });
    test('ST menores de 13: cortes 30 y 37', () {
      c(double t) => reglas.categoria(
        formulario: FormularioCars.st,
        puntajeTotal: t,
        edadAnios: 12,
      );
      expect(c(29.5), CategoriaSeveridad.minimaNula);
      expect(c(30), CategoriaSeveridad.leveModerada);
      expect(c(36.5), CategoriaSeveridad.leveModerada);
      expect(c(37), CategoriaSeveridad.severa);
    });
    test('ST de 13 en adelante: cortes 28 y 35', () {
      c(double t) => reglas.categoria(
        formulario: FormularioCars.st,
        puntajeTotal: t,
        edadAnios: 13,
      );
      expect(c(27.5), CategoriaSeveridad.minimaNula);
      expect(c(28), CategoriaSeveridad.leveModerada);
      expect(c(34.5), CategoriaSeveridad.leveModerada);
      expect(c(35), CategoriaSeveridad.severa);
    });
    test('HF: cortes 28 y 34', () {
      c(double t) => reglas.categoria(
        formulario: FormularioCars.hf,
        puntajeTotal: t,
        edadAnios: 10,
      );
      expect(c(27.5), CategoriaSeveridad.minimaNula);
      expect(c(28), CategoriaSeveridad.leveModerada);
      expect(c(33.5), CategoriaSeveridad.leveModerada);
      expect(c(34), CategoriaSeveridad.severa);
    });
  });

  group('recomendarFormulario', () {
    test('HF con 6+ años, IQ 80+ y lenguaje fluido', () {
      expect(
        reglas.recomendarFormulario(
          edadAnios: 8,
          iq: 95,
          comunicacionFluida: true,
        ),
        FormularioCars.hf,
      );
    });
    test('ST si es menor de 6 años', () {
      expect(
        reglas.recomendarFormulario(
          edadAnios: 5,
          iq: 95,
          comunicacionFluida: true,
        ),
        FormularioCars.st,
      );
    });
    test('ST si IQ es 79 o menos', () {
      expect(
        reglas.recomendarFormulario(
          edadAnios: 9,
          iq: 79,
          comunicacionFluida: true,
        ),
        FormularioCars.st,
      );
    });
    test('ST si la comunicación está afectada', () {
      expect(
        reglas.recomendarFormulario(
          edadAnios: 9,
          iq: 100,
          comunicacionFluida: false,
        ),
        FormularioCars.st,
      );
    });
  });
}
