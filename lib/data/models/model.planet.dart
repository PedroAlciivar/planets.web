import 'package:planets/domain/entity/entity.planet.dart';

class ModelPlanet extends IEntityPlanet {
  const ModelPlanet({
    super.name,
    super.orbitalDistanceKm,
    super.equatorialRadiusKm,
    super.volumeKm3,
    super.massKg,
    super.densityGCm3,
    super.surfaceGravityMS2,
    super.escapeVelocityKmh,
    super.dayLengthEarthDays,
    super.yearLengthEarthDays,
    super.orbitalSpeedKmh,
    super.atmosphereComposition,
    super.moons,
    super.image,
    super.description,
  });

  factory ModelPlanet.fromJson(Map<String, dynamic> json) {
    return ModelPlanet(
      name: json['name'] ?? '',
      orbitalDistanceKm: json['orbital_distance_km'] ?? 0,
      equatorialRadiusKm: json['equatorial_radius_km'] ?? 0,
      volumeKm3: json['volume_km3'].toString(),
      massKg: json['mass_kg'] ?? '',
      densityGCm3: json['density_g_cm3'] ?? 0,
      surfaceGravityMS2: json['surface_gravity_m_s2'] ?? 0,
      escapeVelocityKmh: json['escape_velocity_kmh'] ?? 0,
      dayLengthEarthDays: json['day_length_earth_days'] ?? 0,
      yearLengthEarthDays: json['year_length_earth_days'] ?? 0,
      orbitalSpeedKmh: json['orbital_speed_kmh'] ?? 0,
      atmosphereComposition: json['atmosphere_composition'].split(', ') ?? [],
      moons: json['moons'] ?? 0,
      image: json['image'] ?? '',
      description: json['description'] ?? '',
    );
  }
}
