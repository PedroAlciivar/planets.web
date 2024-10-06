# Proyecto Flutter: Explorador de Planetas

Este proyecto es una aplicación Flutter que muestra información sobre planetas, utilizando una API externa. La arquitectura del proyecto sigue los principios de arquitectura limpia, con separaciones claras entre las capas de datos, dominio y presentación. La interfaz incluye animaciones y efectos visuales para mejorar la experiencia del usuario.

## Tecnologías Utilizadas

- **Flutter**: Framework principal para el desarrollo multiplataforma.
- **Riverpod**: Manejo del estado y de la inyección de dependencias.
- **GoRouter**: Navegación declarativa para cambiar entre rutas.
- **HTTP**: Realización de peticiones HTTP para consumir la API de planetas.
- **Shared Preferences**: Almacenamiento local para datos persistentes.
- **AutoSizeText**: Ajuste responsivo del tamaño de texto según el espacio disponible.
- **SmartDialog**: Para manejar modales y diálogos personalizados.
- **Hovering**: Efectos de hover para cambiar colores de los contenedores en la UI.
- **Particles Flutter**: Animación de fondo que simula el espacio.{
- **LayoutBuilder**: Manejo responsivo de la interfaz según las dimensiones de la pantalla.

## Arquitectura del Proyecto

La aplicación sigue los principios de arquitectura limpia, dividiendo el código en varias capas:

- **Data**: Contiene las fuentes de datos (`datasource`), los modelos (`models`), y los repositorios (`repository`) que gestionan el acceso a los datos.
- **Domain**: Define las entidades (`entity`), los repositorios de dominio (`repository`) y los casos de uso (`use case`) que implementan la lógica de negocio.
- **Helpers**: Funciones auxiliares, como la capitalización de nombres, que aseguran que el primer carácter sea mayúscula.

```bash
lib/
│
├── data/
│   ├── datasource/     # Fuentes de datos, por ejemplo, API de planetas.
│   ├── models/         # Modelos de datos.
│   └── repository/     # Implementaciones de los repositorios que interactúan con los datos.
│
├── domain/
│   ├── entity/         # Definiciones de entidades del dominio.
│   ├── repository/     # Definición de interfaces para los repositorios.
│   └── usecase/        # Lógica de negocio y casos de uso.
│
├── helpers/            # Funciones auxiliares, como la capitalización de nombres.
│
├── presentation/
│   ├── pages/          # Pantallas principales de la UI.
│   │   ├── home/       # Página principal (home).
│   │   ├── info.planet/# Página que muestra la información detallada de un planeta.
│   │   └── planets/    # Página con la lista de planetas.
│   └── widgets/        # Componentes reutilizables de la UI.
│
├── providers/          # Proveedores de estado y dependencias usando Riverpod.
│
├── routes/             # Configuración de rutas utilizando GoRouter.
│
└── main.dart           # Punto de entrada principal de la aplicación.
