# CARS2 App

Aplicación Flutter para la administración y evaluación de datos clínicos relacionados con el test CARS2 (Childhood Autism Rating Scale 2).

## Arquitectura

El proyecto utiliza **Clean Architecture** con el patrón **MVVM** organizado en tres capas principales:

### 📱 Presentation
Contiene la interfaz de usuario y la lógica de presentación (ViewModels). Gestiona la interacción con el usuario y el estado de la UI usando Riverpod.

### 🧠 Domain
Capa de lógica de negocio pura, independiente de Flutter:
- **Entities**: Modelos de dominio
- **Use Cases**: Casos de uso de la aplicación
- **Repositories**: Interfaces de repositorios (implementadas en Data)
- **Services**: Interfaces de servicios (implementadas en Data)

### 💾 Data
Implementación concreta de repositorios y servicios:
- Acceso a datos locales (almacenamiento en dispositivo)
- Integración con servicios remotos (autenticación)

### 🛠️ Core
Utilidades, constantes y helpers compartidos.

## Requisitos

- Flutter 3.11.4 o superior
- Dart SDK 3.11.4 o superior
- Android SDK (solo plataforma Android)

## Instalación

```bash
# Clonar el repositorio
git clone [url-del-repositorio]

# Instalar dependencias
flutter pub get

# Ejecutar la aplicación
flutter run
```

## Pruebas

```bash
# Ejecutar todas las pruebas
flutter test

# Ejecutar análisis estático
flutter analyze
```

## Principios de desarrollo

1. **Clean Architecture**: Separación clara de responsabilidades entre capas
2. **Test-Driven Development**: Las pruebas se escriben primero
3. **Privacidad primero**: Los datos clínicos solo se almacenan localmente
4. **Una funcionalidad a la vez**: Desarrollo incremental y enfocado
