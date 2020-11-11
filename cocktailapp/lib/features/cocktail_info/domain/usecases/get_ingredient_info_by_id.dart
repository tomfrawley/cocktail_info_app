import 'package:cocktailapp/core/error/failures.dart';
import 'package:cocktailapp/core/usecases/usecase.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/ingredient_info.dart';
import 'package:cocktailapp/features/cocktail_info/domain/repositories/cocktail_info_repository.dart';
import 'package:dartz/dartz.dart';

class GetIngredientInfoById extends Usecase<IngredientInfo, Params> {
  final CocktailInfoRepository repository;

  GetIngredientInfoById(this.repository);

  @override
  Future<Either<Failure, IngredientInfo>> call(Params params) async {
    return await repository.getIngredientInfoById(params.id);
  }
}
