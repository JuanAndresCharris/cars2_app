import 'cars_tipos.dart';

enum EstadoSesion { enCurso, finalizada }

class Sesion {
  final String id;
  final int edadAnios;
  final int iq;
  final bool comunicacionFluida;
  final FormularioCars formularioRecomendado;
  final FormularioCars formularioElegido;
  final EstadoSesion estado;
  final DateTime creadaEn;

  const Sesion({
    required this.id,
    required this.edadAnios,
    required this.iq,
    required this.comunicacionFluida,
    required this.formularioRecomendado,
    required this.formularioElegido,
    required this.estado,
    required this.creadaEn,
  });
}
