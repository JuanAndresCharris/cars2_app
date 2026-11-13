import '../domain/entities/sesion.dart';
import '../domain/repositories/sesion_repository.dart';

class SesionRepositoryMemoria implements SesionRepository {
  final List<Sesion> _sesiones = [];

  List<Sesion> get sesiones => List.unmodifiable(_sesiones);

  @override
  Future<void> guardar(Sesion sesion) async {
    _sesiones.add(sesion);
  }
}
