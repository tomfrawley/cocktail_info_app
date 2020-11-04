import 'package:cocktailapp/core/error/Failures.dart';
import 'package:cocktailapp/core/usecases/usecase.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info.dart';
import 'package:cocktailapp/features/cocktail_info/domain/repositories/cocktail_info_repository.dart';
import 'package:dartz/dartz.dart';

class GetRandomCocktailInfo extends Usecase<CocktailInfo, NoParams> {
  final CocktailInfoRepository repository;

  GetRandomCocktailInfo(this.repository);

  @override
  Future<Either<Failure, CocktailInfo>> call(NoParams params) async {
    return await repository.getRandomCocktailInfo();
  }
}
