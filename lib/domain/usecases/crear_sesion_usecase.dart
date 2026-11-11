import '../entities/sesion.dart';
import '../repositories/sesion_repository.dart';
import '../services/reglas_cars.dart';

class CrearSesionUseCase {
  final SesionRepository repositorio;
  final ReglasCars reglas;
  final String Function() generarId;
  final DateTime Function() ahora;

  CrearSesionUseCase({
    required this.repositorio,
    required this.reglas,
    required this.generarId,
    DateTime Function()? ahora,
  }) : ahora = ahora ?? DateTime.now;

  Future<Sesion> call({
    required int edadAnios,
    required int iq,
    required bool comunicacionFluida,
  }) async {
    if (edadAnios < 0) throw ArgumentError('La edad no puede ser negativa.');
    if (iq < 0) throw ArgumentError('El IQ no puede ser negativo.');

    final recomendado = reglas.recomendarFormulario(
      edadAnios: edadAnios,
      iq: iq,
      comunicacionFluida: comunicacionFluida,
    );
    final sesion = Sesion(
      id: generarId(),
      edadAnios: edadAnios,
      iq: iq,
      comunicacionFluida: comunicacionFluida,
      formularioRecomendado: recomendado,
      formularioElegido: recomendado,
      estado: EstadoSesion.enCurso,
      creadaEn: ahora(),
    );
    await repositorio.guardar(sesion);
    return sesion;
  }
}
