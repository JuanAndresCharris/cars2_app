import 'dart:math';

String generarCodigoSesion([Random? random]) {
  const caracteres = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
  final azar = random ?? Random.secure();
  final sufijo = List.generate(
    5,
    (_) => caracteres[azar.nextInt(caracteres.length)],
  ).join();
  return 'S-$sufijo';
}
