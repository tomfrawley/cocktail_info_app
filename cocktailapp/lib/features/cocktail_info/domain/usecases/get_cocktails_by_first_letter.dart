import 'package:cocktailapp/core/error/failures.dart';
import 'package:cocktailapp/core/usecases/usecase.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info_list.dart';
import 'package:cocktailapp/features/cocktail_info/domain/repositories/cocktail_info_repository.dart';
import 'package:dartz/dartz.dart';

class GetCocktailsByFirstLetter extends Usecase<CocktailInfoList, Params> {
  final CocktailInfoRepository repository;

  GetCocktailsByFirstLetter(this.repository);

  @override
  Future<Either<Failure, CocktailInfoList>> call(Params params) async {
    return await repository.getCocktailsByFirstLetter(params.lookupTerm);
  }
}
