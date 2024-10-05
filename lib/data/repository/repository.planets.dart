import 'package:planets/data/models/model.planet.dart';
import 'package:planets/domain/repository/repository.planets.dart';

class RepositoryPlanets extends IRepositoryPlanets {
  @override
  Future<List<ModelPlanet>?> getPlanets() async {
    return await dataSource.getPlanets();
  }

  @override
  Future<ModelPlanet?> getSinglePlanet(String name) async {
    return await dataSource.getSinglePlanet(name);
  }
}
