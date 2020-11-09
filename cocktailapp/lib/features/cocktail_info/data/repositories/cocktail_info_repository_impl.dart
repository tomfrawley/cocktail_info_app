import 'package:cocktailapp/core/platform/network_info.dart';
import 'package:cocktailapp/features/cocktail_info/data/datasources/cocktail_info_remote_data_source.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/ingredient_info.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info_list.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info.dart';
import 'package:cocktailapp/core/error/Failures.dart';
import 'package:cocktailapp/features/cocktail_info/domain/repositories/cocktail_info_repository.dart';
import 'package:dartz/dartz.dart';

class CocktailInfoRepositoryImpl implements CocktailInfoRepository {
  final CocktailInfoRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  CocktailInfoRepositoryImpl({this.remoteDataSource, this.networkInfo});

  @override
  Future<Either<Failure, Categories>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, CocktailInfo>> getCocktailInfoById(int cocktailId) {
    // TODO: implement getCocktailInfoByName
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, CocktailInfoList>> getCocktailsByFirstLetter(String letter) {
    // TODO: implement getCocktailsByFirstLetter
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, CocktailInfoList>> getCocktailsBySearchResults(String searchTerm) {
    // TODO: implement getCocktailsBySearchResults
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, PartialCocktailInfoList>> getCocktailsFilteredByCategory(String category) {
    // TODO: implement getCocktailsFilteredByCategory
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, PartialCocktailInfoList>> getCocktailsFilteredByGlass(String glass) {
    // TODO: implement getCocktailsFilteredByGlass
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, PartialCocktailInfoList>> getCocktailsFilteredByIngredient(String ingredient) {
    // TODO: implement getCocktailsFilteredByIngredient
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Glasses>> getGlasses() {
    // TODO: implement getGlasses
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, IngredientInfo>> getIngredientInfoById(int ingredientId) {
    // TODO: implement getIngredientInfo
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Ingredients>> getIngredients() {
    // TODO: implement getIngredients
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, CocktailInfo>> getRandomCocktailInfo() {
    // TODO: implement getRandomCocktailInfo
    throw UnimplementedError();
  }
}
