import 'package:planets/data/models/model.planet.dart';
import 'package:planets/data/repository/repository.planets.dart';

class UseCasePlanets {
  final repository = RepositoryPlanets();
  Future<List<ModelPlanet>?> getPlanets() async {
    return await repository.getPlanets();
  }

  Future<ModelPlanet?> getSinglePlanet(String name) async {
    return await repository.getSinglePlanet(name);
  }
}
