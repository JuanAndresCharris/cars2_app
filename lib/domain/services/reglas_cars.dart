import '../entities/cars_tipos.dart';

class ReglasCars {
  static const int totalItems = 15;

  FormularioCars recomendarFormulario({
    required int edadAnios,
    required int iq,
    required bool comunicacionFluida,
  }) {
    if (edadAnios >= 6 && iq >= 80 && comunicacionFluida) {
      return FormularioCars.hf;
    }
    return FormularioCars.st;
  }

  double puntajeTotal(List<double> calificaciones) {
    if (calificaciones.length != totalItems) {
      throw ArgumentError('Se requieren $totalItems calificaciones.');
    }
    for (final v in calificaciones) {
      final enPasosDeMedio = (v * 2) == (v * 2).roundToDouble();
      if (v < 1 || v > 4 || !enPasosDeMedio) {
        throw ArgumentError('Valor fuera de escala: $v');
      }
    }
    return calificaciones.fold(0.0, (a, b) => a + b);
  }

  CategoriaSeveridad categoria({
    required FormularioCars formulario,
    required double puntajeTotal,
    required int edadAnios,
  }) {
    final (corteEspectro, corteSevero) = switch (formulario) {
      FormularioCars.hf => (28.0, 34.0),
      FormularioCars.st => edadAnios >= 13 ? (28.0, 35.0) : (30.0, 37.0),
    };
    if (puntajeTotal < corteEspectro) return CategoriaSeveridad.minimaNula;
    if (puntajeTotal < corteSevero) return CategoriaSeveridad.leveModerada;
    return CategoriaSeveridad.severa;
  }
}
