import 'package:planets/data/datasource/datasourse.planets.dart';
import 'package:planets/data/models/model.planet.dart';

abstract class IRepositoryPlanets {
  final dataSource = DataSourcePlanets();
  Future<List<ModelPlanet>?> getPlanets();
  Future<ModelPlanet?> getSinglePlanet(String name);
}
