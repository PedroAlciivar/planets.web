import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planets/data/models/model.planet.dart';
import 'package:planets/domain/usecase/use.case.planets.dart';
import 'package:shared_preferences/shared_preferences.dart';

final infoPlanetsProvider =
    FutureProvider.family<ModelPlanet, String>((ref, planetId) async {
  final useCasePlanets = UseCasePlanets();
  final response = await useCasePlanets.getSinglePlanet(planetId);
  return response ?? const ModelPlanet(name: "error");
});

final sharedPreferencesInitProvider =
    FutureProvider<SharedPreferences>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs;
});

class PlanetRepository {
  static const _planetListKey = 'planet_list';

  Future<void> savePlanets(
      List<String> planets, SharedPreferences prefs) async {
    await prefs.setStringList(_planetListKey, planets);
  }

  List<String> loadPlanets(SharedPreferences prefs) {
    return prefs.getStringList(_planetListKey) ?? [];
  }
}

final planetRepositoryProvider = Provider((ref) => PlanetRepository());

final planetListProvider =
    StateNotifierProvider<PlanetListNotifier, List<String>>((ref) {
  final prefs = ref.watch(sharedPreferencesInitProvider).value;
  final repository = ref.watch(planetRepositoryProvider);
  return PlanetListNotifier(repository, prefs!);
});

class PlanetListNotifier extends StateNotifier<List<String>> {
  final PlanetRepository _repository;
  final SharedPreferences _prefs;

  PlanetListNotifier(this._repository, this._prefs) : super([]) {
    _loadPlanets();
  }

  void _loadPlanets() {
    state = _repository.loadPlanets(_prefs);
  }

  Future<void> addPlanet(String planet) async {
    final updatedList = [...state, planet];
    state = updatedList;
    await _repository.savePlanets(updatedList, _prefs);
  }

  Future<void> removePlanet(String planet) async {
    final updatedList = state.where((p) => p != planet).toList();
    state = updatedList;
    await _repository.savePlanets(updatedList, _prefs);
  }
}
