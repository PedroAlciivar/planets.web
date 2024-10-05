import 'dart:convert';

import 'package:planets/data/models/model.planet.dart';
import 'package:http/http.dart' as http;
import 'package:planets/helpers/capitalize.dart';

class DataSourcePlanets {
  Future<List<ModelPlanet>?> getPlanets() async {
    final response = await http.get(Uri.parse(
        'https://us-central1-a-academia-espacial.cloudfunctions.net/planets'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> data = jsonResponse['data'];
      return data.map((planet) => ModelPlanet.fromJson(planet)).toList();
    } else {
      throw Exception('Failed to load planets');
    }
  }

  Future<ModelPlanet?> getSinglePlanet(String name) async {
    final response = await http.get(Uri.parse(
        'https://us-central1-a-academia-espacial.cloudfunctions.net/planets'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> data = jsonResponse['data'];
      ModelPlanet? planet = data
          .map((planet) => ModelPlanet.fromJson(planet))
          .firstWhere((planet) => planet.name == capitalizeFirstLetter(name),
              orElse: () => const ModelPlanet(name: "error"));
      return planet;
    } else {
      throw Exception('Failed to load planets');
    }
  }
}
