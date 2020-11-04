import 'package:cocktailapp/core/error/Failures.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info.dart';
import 'package:cocktailapp/features/cocktail_info/domain/repositories/cocktail_info_repository.dart';
import 'package:dartz/dartz.dart';

class GetRandomCocktailInfo {
  final CocktailInfoRepository repository;

  GetRandomCocktailInfo(this.repository);

  Future<Either<Failure, CocktailInfo>> execute() async {
    return await repository.getRandomCocktailInfo();
  }
}
