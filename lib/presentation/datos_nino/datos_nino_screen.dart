import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/cars_tipos.dart';
import 'datos_nino_viewmodel.dart';
import '../../core/providers.dart';

class DatosNinoScreen extends ConsumerWidget {
  const DatosNinoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final estado = ref.watch(datosNinoProvider);
    final vm = ref.read(datosNinoProvider.notifier);
    final recomendado = vm.formularioRecomendado;
    final sesion = ref.watch(sesionActualProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Datos del niño')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'No ingreses nombres ni documentos. Solo los datos necesarios.',
          ),
          const SizedBox(height: 16),
          TextField(
            key: const Key('campo_edad'),
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Edad en años',
              border: OutlineInputBorder(),
            ),
            onChanged: (v) => vm.cambiarEdad(int.tryParse(v)),
          ),
          const SizedBox(height: 16),
          TextField(
            key: const Key('campo_iq'),
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'IQ estimado',
              border: OutlineInputBorder(),
            ),
            onChanged: (v) => vm.cambiarIq(int.tryParse(v)),
          ),
          const SizedBox(height: 16),
          const Text('Comunicación del niño'),
          const SizedBox(height: 8),
          SegmentedButton<bool>(
            emptySelectionAllowed: true,
            segments: const [
              ButtonSegment(value: true, label: Text('Fluida')),
              ButtonSegment(value: false, label: Text('Afectada')),
            ],
            selected: estado.comunicacionFluida == null
                ? <bool>{}
                : {estado.comunicacionFluida!},
            onSelectionChanged: (s) =>
                vm.cambiarComunicacionFluida(s.isEmpty ? null : s.first),
          ),
          const SizedBox(height: 24),
          if (recomendado != null) ...[
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Formulario recomendado: ${recomendado == FormularioCars.hf ? 'CARS2-HF' : 'CARS2-ST'}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => vm.crearSesion(),
              child: const Text('Crear sesión'),
            ),
          ],
          if (sesion != null) ...[
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text('Sesión creada: ${sesion.id}'),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
