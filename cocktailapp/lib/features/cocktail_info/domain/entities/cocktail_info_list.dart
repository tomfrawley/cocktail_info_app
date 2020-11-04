import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class CocktailInfoListTemplate extends Equatable {
  final List<CocktailInfoTemplate> cocktailInfoList;

  CocktailInfoListTemplate({
    @required this.cocktailInfoList,
  }) : super([cocktailInfoList]);
}

class CocktailInfoList extends CocktailInfoListTemplate {
  final List<CocktailInfo> cocktailInfoList;

  CocktailInfoList({
    @required this.cocktailInfoList,
  }) : super(cocktailInfoList: cocktailInfoList);
}

class PartialCocktailInfoList extends CocktailInfoListTemplate {
  final List<PartialCocktailInfo> partialCocktailInfoList;

  PartialCocktailInfoList({
    @required this.partialCocktailInfoList,
  }) : super(cocktailInfoList: partialCocktailInfoList);
}

class Glasses extends CocktailInfoListTemplate {
  final List<Glass> glasses;

  Glasses({@required this.glasses}) : super(cocktailInfoList: glasses);
}

class Categories extends CocktailInfoListTemplate {
  final List<Category> categories;

  Categories({@required this.categories}) : super(cocktailInfoList: categories);
}

class Ingredients extends CocktailInfoListTemplate {
  final List<Ingredient> ingredients;

  Ingredients({@required this.ingredients}) : super(cocktailInfoList: ingredients);
}
