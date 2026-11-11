import 'package:flutter_test/flutter_test.dart';
import 'package:cars2_app/domain/entities/cars_tipos.dart';
import 'package:cars2_app/domain/entities/sesion.dart';
import 'package:cars2_app/domain/repositories/sesion_repository.dart';
import 'package:cars2_app/domain/services/reglas_cars.dart';
import 'package:cars2_app/domain/usecases/crear_sesion_usecase.dart';

class RepoSesionesEnMemoria implements SesionRepository {
  final List<Sesion> guardadas = [];
  @override
  Future<void> guardar(Sesion sesion) async => guardadas.add(sesion);
}

void main() {
  late RepoSesionesEnMemoria repo;
  late CrearSesionUseCase crear;

  setUp(() {
    repo = RepoSesionesEnMemoria();
    crear = CrearSesionUseCase(
      repositorio: repo,
      reglas: ReglasCars(),
      generarId: () => 'sesion-1',
      ahora: () => DateTime(2026, 11, 11),
    );
  });

  test('crea una sesión HF recomendada y la deja en curso', () async {
    final s = await crear(edadAnios: 8, iq: 95, comunicacionFluida: true);
    expect(s.id, 'sesion-1');
    expect(s.formularioRecomendado, FormularioCars.hf);
    expect(s.formularioElegido, FormularioCars.hf);
    expect(s.estado, EstadoSesion.enCurso);
  });

  test('recomienda ST si el niño tiene menos de 6 años', () async {
    final s = await crear(edadAnios: 4, iq: 95, comunicacionFluida: true);
    expect(s.formularioRecomendado, FormularioCars.st);
  });

  test('guarda la sesión en el repositorio', () async {
    await crear(edadAnios: 8, iq: 95, comunicacionFluida: true);
    expect(repo.guardadas.length, 1);
  });

  test('rechaza una edad negativa', () {
    expect(
      () => crear(edadAnios: -1, iq: 95, comunicacionFluida: true),
      throwsArgumentError,
    );
  });

  test('rechaza un IQ negativo', () {
    expect(
      () => crear(edadAnios: 8, iq: -5, comunicacionFluida: true),
      throwsArgumentError,
    );
  });
}
