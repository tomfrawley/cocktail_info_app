import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class DrinkInfo extends Equatable {
  final int id;
  final String name;
  final String thumbnail;
  final String category;
  final String glass;
  final String instructions;
  final List<Map<String, String>> ingredientsAndMeasurements;

  DrinkInfo({
    @required this.id,
    @required this.name,
    @required this.thumbnail,
    this.category,
    this.glass,
    this.instructions,
    this.ingredientsAndMeasurements,
  }) : super([id, name, thumbnail, category, glass, instructions, ingredientsAndMeasurements]);
}

class PartialDrinkInfo extends DrinkInfo {
  final int id;
  final String name;
  final String thumbnail;

  PartialDrinkInfo({
    @required this.id,
    @required this.name,
    @required this.thumbnail,
  }) : super(id: id, name: name, thumbnail: thumbnail);
}
