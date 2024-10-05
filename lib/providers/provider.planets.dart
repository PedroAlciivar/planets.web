import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planets/data/models/model.planet.dart';
import 'package:planets/domain/usecase/use.case.planets.dart';

final planetsProvider = FutureProvider<List<ModelPlanet>>((ref) async {
  final useCasePlanets = UseCasePlanets();
  final response = await useCasePlanets.getPlanets();
  return response ?? [];
});

final searchProvider = StateProvider<String>((ref) => '');
