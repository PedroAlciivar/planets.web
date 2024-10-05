import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hovering/hovering.dart';
import 'package:planets/data/models/model.planet.dart';
import 'package:planets/presentation/widgets/background.dart';
import 'package:planets/providers/provider.planets.dart';
import 'package:planets/routes/router.names.dart';

class PlanetsPage extends ConsumerWidget {
  const PlanetsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final planetsAsyncValue = ref.watch(planetsProvider);
    final searchText = ref.watch(searchProvider);
    return LayoutBuilder(
      builder: (context, constraints) {
        //movil
        if (MediaQuery.of(context).size.width < 600) {
          return _body(context, ref, size, planetsAsyncValue, searchText,
              size.width * 0.8);
          //tablet
        } else if (MediaQuery.of(context).size.width < 1024) {
          return _body(
            context,
            ref,
            size,
            planetsAsyncValue,
            searchText,
            size.width * 0.4,
          );
          //web
        } else {
          return _body(context, ref, size, planetsAsyncValue, searchText,
              size.width * 0.2);
        }
      },
    );
  }

  _body(
      BuildContext context,
      WidgetRef ref,
      Size size,
      AsyncValue<List<ModelPlanet>> planetsAsyncValue,
      String searchText,
      double boxWeight) {
    return Stack(
      children: [
        const Background(),
        planetsAsyncValue.when(
            data: (planets) {
              final filteredPlanets = planets.where((planet) {
                return planet.name!
                    .toLowerCase()
                    .contains(searchText.toLowerCase());
              }).toList();
              return Center(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Planets',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                      TextField(
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Buscar planetas',
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                        onChanged: (value) {
                          ref.read(searchProvider.notifier).state = value;
                        },
                      ),
                      SizedBox(
                          height: size.height * 0.8,
                          width: size.width * 1,
                          child: SingleChildScrollView(
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 10,
                              runSpacing: 10,
                              children: List.generate(filteredPlanets.length,
                                  (index) {
                                return InkWell(
                                  onTap: () {
                                    context.goNamed(RouteNames.planets,
                                        pathParameters: {
                                          'name':
                                              filteredPlanets[index].name ?? '',
                                        });
                                  },
                                  child: HoverAnimatedContainer(
                                    height: size.height * 0.4,
                                    width: boxWeight,
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        border:
                                            Border.all(color: Colors.lightBlue),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20))),
                                    hoverDecoration: BoxDecoration(
                                        color: Colors.lightBlue,
                                        border: Border.all(color: Colors.white),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          height: size.height * 0.3,
                                          width: boxWeight,
                                          child: Image.network(
                                            filteredPlanets[index].image ?? '',
                                            loadingBuilder:
                                                (BuildContext context,
                                                    Widget child,
                                                    ImageChunkEvent?
                                                        loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child;
                                              }
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  value: loadingProgress
                                                              .expectedTotalBytes !=
                                                          null
                                                      ? loadingProgress
                                                              .cumulativeBytesLoaded /
                                                          (loadingProgress
                                                                  .expectedTotalBytes ??
                                                              1)
                                                      : null,
                                                ),
                                              );
                                            },
                                            errorBuilder: (BuildContext context,
                                                Object exception,
                                                StackTrace? stackTrace) {
                                              return const Center(
                                                child: Text(
                                                  'Error loading image',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Text(
                                          filteredPlanets[index].name ?? '',
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ))
                    ],
                  ),
                ),
              );
            },
            loading: () => const Center(
                    child: CircularProgressIndicator(
                  color: Colors.cyanAccent,
                )),
            error: (error, stack) => Center(child: Text('Error: $error'))),
      ],
    );
  }
}
