import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class DrinkInfoTemplate extends Equatable {
  final int id;
  final String name;
  final String thumbnail;
  final String category;
  final String glass;
  final String instructions;
  final List<Map<String, String>> ingredientsAndMeasurements;

  DrinkInfoTemplate({
    this.id,
    this.name,
    this.thumbnail,
    this.category,
    this.glass,
    this.instructions,
    this.ingredientsAndMeasurements,
  }) : super([id, name, thumbnail, category, glass, instructions, ingredientsAndMeasurements]);
}

abstract class DrinkInfo extends DrinkInfoTemplate {
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
    @required this.category,
    @required this.glass,
    @required this.instructions,
    @required this.ingredientsAndMeasurements,
  }) : super(
          id: id,
          name: name,
          thumbnail: thumbnail,
          category: category,
          glass: glass,
          instructions: instructions,
          ingredientsAndMeasurements: ingredientsAndMeasurements,
        );
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

class Glass extends DrinkInfoTemplate {
  final String glass;

  Glass({
    @required this.glass,
  }) : super(glass: glass);
}

class Category extends DrinkInfoTemplate {
  final String category;

  Category({
    @required this.category,
  }) : super(category: category);
}
