import 'package:cocktailapp/features/cocktail_info/domain/entities/drink_info.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class CocktailInfoListTemplate extends Equatable {
  final List<CocktailInfoTemplate> drinkInfoList;

  CocktailInfoListTemplate({
    @required this.drinkInfoList,
  }) : super([drinkInfoList]);
}

class CocktailInfoList extends CocktailInfoListTemplate {
  final List<CocktailInfo> drinkInfoList;

  CocktailInfoList({
    @required this.drinkInfoList,
  }) : super(drinkInfoList: drinkInfoList);
}

class PartialCocktailInfoList extends CocktailInfoListTemplate {
  final List<PartialCocktailInfo> partialDrinkInfoList;

  PartialCocktailInfoList({
    @required this.partialDrinkInfoList,
  }) : super(drinkInfoList: partialDrinkInfoList);
}

class Glasses extends CocktailInfoListTemplate {
  final List<Glass> glasses;

  Glasses({@required this.glasses}) : super(drinkInfoList: glasses);
}

class Categories extends CocktailInfoListTemplate {
  final List<Category> categories;

  Categories({@required this.categories}) : super(drinkInfoList: categories);
}
