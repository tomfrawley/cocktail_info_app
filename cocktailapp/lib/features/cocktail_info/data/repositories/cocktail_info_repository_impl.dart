import 'package:cocktailapp/core/error/exception.dart';
import 'package:cocktailapp/core/error/failures.dart';
import 'package:cocktailapp/core/platform/network_info.dart';
import 'package:cocktailapp/features/cocktail_info/data/datasources/cocktail_info_remote_data_source.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/ingredient_info.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info_list.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info.dart';
import 'package:cocktailapp/features/cocktail_info/domain/repositories/cocktail_info_repository.dart';
import 'package:dartz/dartz.dart';

class CocktailInfoRepositoryImpl implements CocktailInfoRepository {
  final CocktailInfoRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  CocktailInfoRepositoryImpl({this.remoteDataSource, this.networkInfo});

  dynamic accessCocktailAPI(Function call) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await call);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, Categories>> getCategories() async {
    return accessCocktailAPI(() {
      remoteDataSource.getCategories();
    });
  }

  @override
  Future<Either<Failure, CocktailInfo>> getCocktailInfoById(int cocktailId) async {
    return accessCocktailAPI(() {
      remoteDataSource.getCocktailInfoById(cocktailId);
    });
  }

  @override
  Future<Either<Failure, CocktailInfoList>> getCocktailsByFirstLetter(String letter) async {
    return accessCocktailAPI(() {
      remoteDataSource.getCocktailsByFirstLetter(letter);
    });
  }

  @override
  Future<Either<Failure, CocktailInfoList>> getCocktailsBySearchResults(String searchTerm) async {
    return accessCocktailAPI(() {
      remoteDataSource.getCocktailsBySearchResults(searchTerm);
    });
  }

  @override
  Future<Either<Failure, PartialCocktailInfoList>> getCocktailsFilteredByCategory(String category) async {
    return accessCocktailAPI(() {
      remoteDataSource.getCocktailsFilteredByCategory(category);
    });
  }

  @override
  Future<Either<Failure, PartialCocktailInfoList>> getCocktailsFilteredByGlass(String glass) async {
    return accessCocktailAPI(() {
      remoteDataSource.getCocktailsFilteredByGlass(glass);
    });
  }

  @override
  Future<Either<Failure, PartialCocktailInfoList>> getCocktailsFilteredByIngredient(String ingredient) async {
    return accessCocktailAPI(() {
      remoteDataSource.getCocktailsFilteredByIngredient(ingredient);
    });
  }

  @override
  Future<Either<Failure, Glasses>> getGlasses() async {
    return accessCocktailAPI(() {
      remoteDataSource.getGlasses();
    });
  }

  @override
  Future<Either<Failure, IngredientInfo>> getIngredientInfoById(int ingredientId) async {
    return accessCocktailAPI(() {
      remoteDataSource.getIngredientInfoById(ingredientId);
    });
  }

  @override
  Future<Either<Failure, Ingredients>> getIngredients() async {
    return accessCocktailAPI(() {
      remoteDataSource.getIngredients();
    });
  }

  @override
  Future<Either<Failure, CocktailInfo>> getRandomCocktailInfo() async {
    return accessCocktailAPI(() {
      remoteDataSource.getRandomCocktialInfo();
    });
  }
}
