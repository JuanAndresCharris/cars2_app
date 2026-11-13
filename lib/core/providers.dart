import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/sesion_repository_memoria.dart';
import '../domain/entities/sesion.dart';
import '../domain/repositories/sesion_repository.dart';
import '../domain/services/reglas_cars.dart';
import '../domain/usecases/crear_sesion_usecase.dart';
import 'codigo_sesion.dart';

final sesionRepositoryProvider = Provider<SesionRepository>(
  (ref) => SesionRepositoryMemoria(),
);

final crearSesionUseCaseProvider = Provider<CrearSesionUseCase>(
  (ref) => CrearSesionUseCase(
    repositorio: ref.watch(sesionRepositoryProvider),
    reglas: ReglasCars(),
    generarId: generarCodigoSesion,
  ),
);

class SesionActualNotifier extends Notifier<Sesion?> {
  @override
  Sesion? build() => null;

  void establecer(Sesion sesion) {
    state = sesion;
  }
}

final sesionActualProvider = NotifierProvider<SesionActualNotifier, Sesion?>(
  SesionActualNotifier.new,
);
