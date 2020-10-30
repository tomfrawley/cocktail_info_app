import 'package:equatable/equatable.dart';

class IngredientInfo extends Equatable {
  final int id;
  final String name;
  final String description;
  final String type;
  final bool containsAlcohol;
  final String abbreviation;

  IngredientInfo({
    this.id,
    this.name,
    this.description,
    this.type,
    this.containsAlcohol,
    this.abbreviation,
  }) : super([
          id,
          name,
          description,
          type,
          containsAlcohol,
          abbreviation,
        ]);
}
