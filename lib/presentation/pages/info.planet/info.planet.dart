import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:planets/data/models/model.planet.dart';
import 'package:planets/helpers/image.planet.dart';
import 'package:planets/presentation/widgets/background.dart';
import 'package:planets/providers/provider.info.planet.dart';
import 'package:planets/routes/router.names.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InfoPlanetPage extends ConsumerWidget {
  final String name;
  const InfoPlanetPage({super.key, required this.name});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final planetInfo = ref.watch(infoPlanetsProvider(name));
    final favoriteList = ref.watch(planetListProvider);
    final sharedPreferencesAsyncValue =
        ref.watch(sharedPreferencesInitProvider);
    return LayoutBuilder(
      builder: (context, constraints) {
        //movil
        if (MediaQuery.of(context).size.width < 600) {
          return _body(context, ref, size, planetInfo, favoriteList,
              sharedPreferencesAsyncValue, size.width * 0.8, size.width * 0.7);
          //tablet
        } else if (MediaQuery.of(context).size.width < 1024) {
          return _body(context, ref, size, planetInfo, favoriteList,
              sharedPreferencesAsyncValue, size.width * 0.7, size.width * 0.6);
          //web
        } else {
          return _body(context, ref, size, planetInfo, favoriteList,
              sharedPreferencesAsyncValue, size.width * 0.3, size.width * 0.2);
        }
      },
    );
  }

  _body(
      BuildContext context,
      WidgetRef ref,
      Size size,
      AsyncValue<ModelPlanet> planetInfo,
      List<String> favoriteList,
      AsyncValue<SharedPreferences> sharedPreferencesAsyncValue,
      double boxWidth,
      imageWidth) {
    return Stack(
      children: [
        const Background(),
        planetInfo.when(
          data: (planet) => Center(
            child: planet.name != "error"
                ? Container(
                    height: size.height * 0.6,
                    width: boxWidth,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: Colors.lightBlue),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        sharedPreferencesAsyncValue.when(
                          data: (prefs) => IconButton(
                              onPressed: () async {
                                if (favoriteList.contains(planet.name)) {
                                  await ref
                                      .read(planetListProvider.notifier)
                                      .removePlanet(planet.name ?? '');
                                } else {
                                  await ref
                                      .read(planetListProvider.notifier)
                                      .addPlanet(planet.name ?? '');
                                }
                              },
                              icon: Text(
                                '★',
                                style: TextStyle(
                                    fontSize: 30,
                                    color: favoriteList.contains(planet.name)
                                        ? Colors.white
                                        : Colors.yellow),
                              )),
                          loading: () => const CircularProgressIndicator(),
                          error: (error, stack) => Text('Error: $error'),
                        ),
                        SizedBox(
                          height: size.height * 0.3,
                          width: imageWidth,
                          child: Image.network(
                            imagePlanet(planet.name ?? ''),
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          (loadingProgress.expectedTotalBytes ??
                                              1)
                                      : null,
                                ),
                              );
                            },
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return const Center(
                                child: Text('Error loading image'),
                              );
                            },
                          ),
                        ),
                        IconButton(
                          onPressed: () => SmartDialog.show(
                              clickMaskDismiss: false,
                              builder: (context) => _showDescription(
                                  size, boxWidth, planet.description ?? '')),
                          icon: const Text(
                            'ℹ️',
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ),
                        Text(
                          "Nombre: ${planet.name ?? ''}",
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Masa: ${planet.massKg ?? ''}",
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Distancia Orbital: ${planet.orbitalDistanceKm.toString()}",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  )
                : Container(
                    height: size.height * 0.6,
                    width: boxWidth,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: Colors.lightBlue),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Planeta No Encontrado",
                          style: TextStyle(color: Colors.white),
                        ),
                        Image.network(
                          "https://media.istockphoto.com/id/1250923288/vector/error-404-template-with-cosmos-background-page-not-found-message.jpg?s=612x612&w=0&k=20&c=tGbn1M3HWjHj3XdGGN-8Up44GxFH1QWvOo5dKJwuANw=",
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        (loadingProgress.expectedTotalBytes ??
                                            1)
                                    : null,
                              ),
                            );
                          },
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return const Center(
                              child: Text('Error loading image'),
                            );
                          },
                        ),
                        ElevatedButton(
                            onPressed: () => context.go(RouteNames.planets),
                            child: const Text("Regresar a Planetas"))
                      ],
                    ),
                  ),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Text('Error: $err'),
        ),
      ],
    );
  }
}

_showDescription(Size size, double boxWidth, String description) {
  return Container(
    height: size.height * 0.6,
    width: boxWidth,
    padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
    decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.lightBlue),
        borderRadius: const BorderRadius.all(Radius.circular(20))),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: () => SmartDialog.dismiss(),
                icon: const Text(
                  'X',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ))),
        Container(
          height: size.height * 0.5,
          width: boxWidth,
          margin: EdgeInsets.only(top: size.height * 0.02),
          child: Text(
            description,
            maxLines: null,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
  );
}
