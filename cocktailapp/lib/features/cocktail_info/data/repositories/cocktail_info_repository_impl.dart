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

  dynamic _accessCocktailRemoteDataSource(Function call) async {
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
    return _accessCocktailRemoteDataSource(() {
      remoteDataSource.getCategories();
    });
  }

  @override
  Future<Either<Failure, CocktailInfo>> getCocktailInfoById(int cocktailId) async {
    return _accessCocktailRemoteDataSource(() {
      remoteDataSource.getCocktailInfoById(cocktailId);
    });
  }

  @override
  Future<Either<Failure, CocktailInfoList>> getCocktailsByFirstLetter(String letter) async {
    return _accessCocktailRemoteDataSource(() {
      remoteDataSource.getCocktailsByFirstLetter(letter);
    });
  }

  @override
  Future<Either<Failure, CocktailInfoList>> getCocktailsBySearchResults(String searchTerm) async {
    return _accessCocktailRemoteDataSource(() {
      remoteDataSource.getCocktailsBySearchResults(searchTerm);
    });
  }

  @override
  Future<Either<Failure, PartialCocktailInfoList>> getCocktailsFilteredByCategory(String category) async {
    return _accessCocktailRemoteDataSource(() {
      remoteDataSource.getCocktailsFilteredByCategory(category);
    });
  }

  @override
  Future<Either<Failure, PartialCocktailInfoList>> getCocktailsFilteredByGlass(String glass) async {
    return _accessCocktailRemoteDataSource(() {
      remoteDataSource.getCocktailsFilteredByGlass(glass);
    });
  }

  @override
  Future<Either<Failure, PartialCocktailInfoList>> getCocktailsFilteredByIngredient(String ingredient) async {
    return _accessCocktailRemoteDataSource(() {
      remoteDataSource.getCocktailsFilteredByIngredient(ingredient);
    });
  }

  @override
  Future<Either<Failure, Glasses>> getGlasses() async {
    return _accessCocktailRemoteDataSource(() {
      remoteDataSource.getGlasses();
    });
  }

  @override
  Future<Either<Failure, IngredientInfo>> getIngredientInfoById(int ingredientId) async {
    return _accessCocktailRemoteDataSource(() {
      remoteDataSource.getIngredientInfoById(ingredientId);
    });
  }

  @override
  Future<Either<Failure, Ingredients>> getIngredients() async {
    return _accessCocktailRemoteDataSource(() {
      remoteDataSource.getIngredients();
    });
  }

  @override
  Future<Either<Failure, CocktailInfo>> getRandomCocktailInfo() async {
    return _accessCocktailRemoteDataSource(() {
      remoteDataSource.getRandomCocktialInfo();
    });
  }
}
