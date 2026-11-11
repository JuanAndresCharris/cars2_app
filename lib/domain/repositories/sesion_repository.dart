import '../entities/sesion.dart';

abstract class SesionRepository {
  Future<void> guardar(Sesion sesion);
}
