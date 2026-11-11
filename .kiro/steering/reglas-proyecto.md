# Reglas del Proyecto CARS2 App

## Arquitectura

- **Clean Architecture con MVVM**: El proyecto está organizado en tres capas (presentation, domain, data).
- **Independencia de Flutter en Domain**: La capa `domain` NO debe tener dependencias de Flutter. Es lógica de negocio pura en Dart.
- **Separación de responsabilidades**: 
  - `presentation`: UI y ViewModels (usando Riverpod)
  - `domain`: Entities, Use Cases, interfaces de Repositories y Services
  - `data`: Implementación concreta de repositorios y servicios
  - `core`: Utilidades compartidas

## Privacidad y seguridad

- **Datos clínicos locales**: Los datos clínicos del niño (evaluaciones, resultados, información personal) se guardan ÚNICAMENTE en el dispositivo. NO se envían a servicios remotos.
- **Autenticación remota**: Firebase Authentication solo maneja datos de cuenta del terapeuta (email, contraseña, perfil básico).
- **Separación estricta**: NUNCA mezclar datos clínicos con datos de autenticación. Son dos dominios separados con diferentes niveles de privacidad.

## Desarrollo guiado por pruebas (TDD)

- **Test first**: Siempre escribir primero la prueba que especifica el comportamiento esperado.
- **Mínimo código**: Después de la prueba, escribir el mínimo código necesario para que la prueba pase.
- **Refactorizar**: Una vez que la prueba pasa, refactorizar si es necesario manteniendo las pruebas en verde.

## Alcance y control de funcionalidades

- **Una historia de usuario a la vez**: No implementar funcionalidades que no se hayan solicitado explícitamente.
- **No agregar características extra**: Evitar la tentación de "mejorar" agregando funcionalidades no pedidas.
- **No instalar dependencias sin autorización**: Pedir confirmación antes de agregar nuevas dependencias al proyecto.

## Commits y control de versiones

- **Commits pequeños y frecuentes**: Hacer commits pequeños con cambios atómicos.
- **Prefijos de commits**:
  - `test:` para agregar o modificar pruebas
  - `feat:` para nuevas funcionalidades
  - `refactor:` para refactorización de código
  - `chore:` para tareas de mantenimiento (dependencias, configuración)
  - `fix:` para corrección de bugs
  - `docs:` para cambios en documentación

## Convenciones de código

- Usar nombres descriptivos en español para variables y funciones de negocio
- Seguir las convenciones de Dart y Flutter (lowerCamelCase para variables, UpperCamelCase para clases)
- Mantener las clases pequeñas y con una sola responsabilidad
- Preferir composición sobre herencia
- Documentar las clases y métodos públicos
