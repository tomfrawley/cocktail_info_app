import 'package:cocktailapp/core/error/failures.dart';
import 'package:cocktailapp/core/usecases/usecase.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info_list.dart';
import 'package:cocktailapp/features/cocktail_info/domain/repositories/cocktail_info_repository.dart';
import 'package:dartz/dartz.dart';

class GetCocktailsFilteredByCategory extends Usecase<PartialCocktailInfoList, Params> {
  final CocktailInfoRepository repository;

  GetCocktailsFilteredByCategory(this.repository);

  @override
  Future<Either<Failure, PartialCocktailInfoList>> call(Params params) async {
    return await repository.getCocktailsFilteredByCategory(params.lookupTerm);
  }
}
