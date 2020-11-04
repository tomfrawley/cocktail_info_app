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
}
