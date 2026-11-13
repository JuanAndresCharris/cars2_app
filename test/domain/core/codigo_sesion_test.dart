import 'package:flutter_test/flutter_test.dart';
import 'package:cars2_app/core/codigo_sesion.dart';

void main() {
  test('el código tiene el formato S- y cinco caracteres', () {
    final codigo = generarCodigoSesion();
    expect(RegExp(r'^S-[A-HJ-NP-Z2-9]{5}$').hasMatch(codigo), true);
  });
}
