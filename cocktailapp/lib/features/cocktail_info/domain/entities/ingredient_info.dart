import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class IngredientInfo extends Equatable {
  final int id;
  final String name;
  final String description;
  final String type;
  final bool containsAlcohol;
  final String abbreviation;

  IngredientInfo({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.type,
    @required this.containsAlcohol,
    @required this.abbreviation,
  }) : super([
          id,
          name,
          description,
          type,
          containsAlcohol,
          abbreviation,
        ]);
}
