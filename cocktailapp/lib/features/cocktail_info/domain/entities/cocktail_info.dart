import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class CocktailInfoTemplate extends Equatable {
  final int id;
  final String name;
  final String thumbnail;
  final String category;
  final String glass;
  final String instructions;
  final Map<String, String> ingredientsAndMeasurements;

  CocktailInfoTemplate({
    this.id,
    this.name,
    this.thumbnail,
    this.category,
    this.glass,
    this.instructions,
    this.ingredientsAndMeasurements,
  }) : super([id, name, thumbnail, category, glass, instructions, ingredientsAndMeasurements]);
}

class CocktailInfo extends CocktailInfoTemplate {
  final int id;
  final String name;
  final String thumbnail;
  final String category;
  final String glass;
  final String instructions;
  final Map<String, String> ingredientsAndMeasurements;

  CocktailInfo({
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

class PartialCocktailInfo extends CocktailInfoTemplate {
  final int id;
  final String name;
  final String thumbnail;

  PartialCocktailInfo({
    @required this.id,
    @required this.name,
    @required this.thumbnail,
  }) : super(id: id, name: name, thumbnail: thumbnail);
}

class Glass extends CocktailInfoTemplate {
  final String glass;

  Glass({
    @required this.glass,
  }) : super(glass: glass);
}

class Category extends CocktailInfoTemplate {
  final String category;

  Category({
    @required this.category,
  }) : super(category: category);
}

class Ingredient extends CocktailInfoTemplate {
  final Map<String, String> ingredientsAndMeasurements;

  Ingredient({
    @required this.ingredientsAndMeasurements,
  }) : super(ingredientsAndMeasurements: ingredientsAndMeasurements);
}
