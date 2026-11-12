Retrospectiva de la iteración 0
Fechas: 10 y 11 de noviembre de 2026
Objetivo: preparar el proyecto (repositorio, estructura, integración continua y backlog) y construir la primera lógica del dominio.
Qué se hizo
Repositorio en GitHub con estructura por capas (presentation, domain, data, core).
Integración continua con GitHub Actions: flutter analyze y flutter test en cada push.
Reglas del CARS2 (puntaje total, categoría de severidad y recomendación ST/HF), probadas con los casos de Michael y Daniel del manual.
Primer caso de uso: crear sesión con recomendación de formulario, con su entidad y su interfaz de repositorio.
Tablero "Backlog CARS2" con las 19 historias de la entrega 1.
Qué salió bien
El dominio quedó separado de Flutter, así que las pruebas corren en segundos.
El CI detectó cada problema pocos minutos después de subir el código.
Se siguió el ciclo rojo, verde y commit en la lógica del dominio.
Qué salió mal
Tres ejecuciones del CI en rojo (de cinco):
La versión de Dart del servidor (3.5.0) era menor que la que pide el proyecto (^3.11.4). Se corrigió fijando la versión de Flutter en ci.yml. Esta falla afectó también a la primera ejecución.
flutter analyze marcó la regla curly_braces_in_flow_control_structures. Se corrigió agregando llaves al if.
Un archivo del dominio se creó en test/domain y, al moverlo a lib/domain/services, el editor cambió su import. Hubo que corregirlo a mano.
El archivo de prueba de crear sesión se creó dentro de lib/domain y hubo que moverlo a test/domain.
Las pruebas iniciales se prepararon con apoyo de un asistente de IA. Falta que el desarrollador escriba pruebas propias.
Qué cambiar
Ejecutar flutter analyze y flutter test en el computador antes de cada push.
Verificar la carpeta de cada archivo antes de pegar el código.
Escribir al menos una prueba propia por historia.
Estimar las tarjetas y medir la velocidad real en la iteración 1.
Definir con el asesor quién actúa como cliente.
Riesgos que quedan
Ninguna historia está completa de punta a punta: faltan pantallas, base local cifrada y autenticación (Firebase).
Falta transcribir el contenido del CARS2 (ítems, QPC y tablas de T y percentil) a archivos de datos.
El cronograma original era para cuatro personas, y ahora es una.