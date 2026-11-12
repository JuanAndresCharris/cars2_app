import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/cars_tipos.dart';
import '../../domain/services/reglas_cars.dart';

class DatosNinoState {
  final int? edadAnios;
  final int? iq;
  final bool? comunicacionFluida;

  const DatosNinoState({this.edadAnios, this.iq, this.comunicacionFluida});

  bool get esValido =>
      edadAnios != null &&
      edadAnios! >= 0 &&
      iq != null &&
      iq! >= 0 &&
      comunicacionFluida != null;
}

class DatosNinoViewModel extends Notifier<DatosNinoState> {
  final ReglasCars _reglas = ReglasCars();

  @override
  DatosNinoState build() => const DatosNinoState();

  void cambiarEdad(int? valor) {
    state = DatosNinoState(
      edadAnios: valor,
      iq: state.iq,
      comunicacionFluida: state.comunicacionFluida,
    );
  }

  void cambiarIq(int? valor) {
    state = DatosNinoState(
      edadAnios: state.edadAnios,
      iq: valor,
      comunicacionFluida: state.comunicacionFluida,
    );
  }

  void cambiarComunicacionFluida(bool? valor) {
    state = DatosNinoState(
      edadAnios: state.edadAnios,
      iq: state.iq,
      comunicacionFluida: valor,
    );
  }

  FormularioCars? get formularioRecomendado {
    if (!state.esValido) {
      return null;
    }
    return _reglas.recomendarFormulario(
      edadAnios: state.edadAnios!,
      iq: state.iq!,
      comunicacionFluida: state.comunicacionFluida!,
    );
  }
}

final datosNinoProvider = NotifierProvider<DatosNinoViewModel, DatosNinoState>(
  DatosNinoViewModel.new,
);
