import 'package:cocktailapp/features/cocktail_info/domain/entities/ingredient_info.dart';
import 'package:meta/meta.dart';

class IngredientInfoModel extends IngredientInfo {
  IngredientInfoModel({
    @required int id,
    @required String name,
    @required String description,
    @required String type,
    @required bool containsAlcohol,
    @required String abbreviation,
  }) : super(
          id: id,
          name: name,
          description: description,
          type: type,
          containsAlcohol: containsAlcohol,
          abbreviation: abbreviation,
        );

  factory IngredientInfoModel.fromJson(Map<String, dynamic> json) {
    return IngredientInfoModel(
        id: int.parse(json['idIngredient']),
        name: json['strIngredient'],
        description: json['strDescription'],
        type: json['strType'],
        containsAlcohol: (json['strAlcohol'] == null) ? false : true,
        abbreviation: json['strABV']);
  }
}
