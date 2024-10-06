# Proyecto Flutter: Planetas

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
- **Particles Flutter**: Animación de fondo que simula el espacio.
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
```

### Explicación de Carpetas

- **data**: Gestiona la interacción con las fuentes de datos externas, como las APIs. Aquí también se definen los modelos que representan los datos que la aplicación consume.
  
- **domain**: Contiene la lógica de negocio principal y define las entidades del dominio. Los casos de uso encapsulan la lógica específica de cada operación del negocio.

- **presentation**: Responsable de la interfaz de usuario, con diferentes páginas y componentes reutilizables.

- **providers**: Incluye los proveedores de estado de Riverpod que manejan el acceso a datos y la lógica de estado compartido entre diferentes partes de la aplicación.

- **routes**: Contiene la configuración de las rutas de la aplicación, utilizando GoRouter para la navegación entre las diferentes pantallas.


## Ejecución del Proyecto

### Requisitos

- **Flutter**: Versión 3.22
- **Dart**: Versión 3.4.0

### Pasos para Ejecutar

1. Clona el repositorio en tu máquina local:
   ```bash
   git clone https://github.com/tu_usuario/tu_repositorio.git
   ```

2. Instala las dependencias del proyecto:
   ```bash
   flutter pub get
   ```

3. Ejecuta la aplicación en tu dispositivo o simulador:
   ```bash
   flutter run
   ```


### Enlace a la versión web

Puedes acceder a la versión web de la aplicación en GitHub Pages mediante el siguiente enlace:
https://pedroalciivar.github.io/planets.web/
