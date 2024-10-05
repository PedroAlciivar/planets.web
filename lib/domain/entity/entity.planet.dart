import 'package:flutter/material.dart';

@immutable
abstract class IEntityPlanet {
  final String? name;
  final int? orbitalDistanceKm;
  final int? equatorialRadiusKm;
  final String? volumeKm3;
  final String? massKg;
  final num? densityGCm3;
  final num? surfaceGravityMS2;
  final int? escapeVelocityKmh;
  final num? dayLengthEarthDays;
  final num? yearLengthEarthDays;
  final int? orbitalSpeedKmh;
  final List<String>? atmosphereComposition;
  final int? moons;
  final String? image;
  final String? description;

  const IEntityPlanet({
    this.name,
    this.orbitalDistanceKm,
    this.equatorialRadiusKm,
    this.volumeKm3,
    this.massKg,
    this.densityGCm3,
    this.surfaceGravityMS2,
    this.escapeVelocityKmh,
    this.dayLengthEarthDays,
    this.yearLengthEarthDays,
    this.orbitalSpeedKmh,
    this.atmosphereComposition,
    this.moons,
    this.image,
    this.description,
  });
}
