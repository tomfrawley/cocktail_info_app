import 'dart:convert';

import 'package:cocktailapp/core/error/exception.dart';
import 'package:cocktailapp/features/cocktail_info/data/datasources/cocktail_info_remote_data_source.dart';
import 'package:cocktailapp/features/cocktail_info/data/models/cocktail_info_list_model.dart';
import 'package:cocktailapp/features/cocktail_info/data/models/cocktail_info_model.dart';
import 'package:cocktailapp/features/cocktail_info/data/models/ingredient_info_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:matcher/matcher.dart';
import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  CocktailInfoRemoteDataSourceImpl dataSource;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = CocktailInfoRemoteDataSourceImpl(client: mockHttpClient);
  });

  void setUpMockHttpClientSuccess200(String fixtureFile) {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
      (_) async => http.Response(fixture(fixtureFile), 200),
    );
  }

  void setUpMockHttpClientFailure404() {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
      (_) async => http.Response('Something went wrong', 404),
    );
  }

  group('getCategories', () {
    final tCategoriesModel = CategoriesModel.fromJson(json.decode(fixture('categories.json')));
    test('should preform a GET request on a URL to the endpoint c=list and with application/json header', () async {
      //Arrange
      setUpMockHttpClientSuccess200('categories.json');
      //Act
      dataSource.getCategories();
      //Assert
      verify(mockHttpClient.get(
        'https://www.thecocktaildb.com/api/json/v1/1/list.php?c=list',
        headers: {'Content-Type': 'application/json'},
      ));
    });

    test('should return Categories when the response code is 200 (success)', () async {
      //Arrange
      setUpMockHttpClientSuccess200('categories.json');
      //Act
      final result = await dataSource.getCategories();
      //Assert
      expect(result, equals(tCategoriesModel));
    });

    test('should throw a ServerException when the response is code 404 or other', () async {
      //Arrange
      setUpMockHttpClientFailure404();
      //Act
      final call = dataSource.getCategories;
      //Assert
      expect(() => call(), throwsA(TypeMatcher<ServerException>()));
    });
  });

  group('getCocktailInfoById', () {
    final tCocktialId = 1;
    final tCocktailInfoModel = CocktailInfoModel.fromJson(json.decode(fixture('full_drink_info.json')));
    test('should preform a GET request on a URL to the endpoint i={tCocktailId} and with application/json header', () async {
      //Arrange
      setUpMockHttpClientSuccess200('full_drink_info.json');
      //Act
      dataSource.getCocktailInfoById(tCocktialId);
      //Assert
      verify(mockHttpClient.get(
        'https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=1',
        headers: {'Content-Type': 'application/json'},
      ));
    });

    test('should return CocktailInfoModel when the response code is 200 (success)', () async {
      //Arrange
      setUpMockHttpClientSuccess200('full_drink_info.json');
      //Act
      final result = await dataSource.getCocktailInfoById(tCocktialId);
      //Assert
      expect(result, equals(tCocktailInfoModel));
    });

    test('should throw a ServerException when the response is code 404 or other', () async {
      //Arrange
      setUpMockHttpClientFailure404();
      //Act
      final call = dataSource.getCocktailInfoById;
      //Assert
      expect(() => call(tCocktialId), throwsA(TypeMatcher<ServerException>()));
    });
  });

  group('getCocktailsByFirstLetter', () {
    final tLetter = 'a';
    final tCocktailInfoListModel = CocktailInfoListModel.fromJson(json.decode(fixture('cocktail_info_list.json')));
    test('should preform a GET request on a URL to the endpoint f=tLetter and with application/json header', () async {
      //Arrange
      setUpMockHttpClientSuccess200('cocktail_info_list.json');
      //Act
      dataSource.getCocktailsByFirstLetter(tLetter);
      //Assert
      verify(mockHttpClient.get(
        'https://www.thecocktaildb.com/api/json/v1/1/search.php?f=$tLetter',
        headers: {'Content-Type': 'application/json'},
      ));
    });

    test('should return CocktailInfoModel when the response code is 200 (success)', () async {
      //Arrange
      setUpMockHttpClientSuccess200('cocktail_info_list.json');
      //Act
      final result = await dataSource.getCocktailsByFirstLetter(tLetter);
      //Assert
      expect(result, equals(tCocktailInfoListModel));
    });

    test('should throw a ServerException when the response is code 404 or other', () async {
      //Arrange
      setUpMockHttpClientFailure404();
      //Act
      final call = dataSource.getCocktailsByFirstLetter;
      //Assert
      expect(() => call(tLetter), throwsA(TypeMatcher<ServerException>()));
    });
  });

  group('getCocktailsBySearchResults', () {
    final tSearchTerm = 'a';
    final tCocktailInfoListModel = CocktailInfoListModel.fromJson(json.decode(fixture('cocktail_info_list.json')));
    test('should preform a GET request on a URL to the endpoint s=$tSearchTerm and with application/json header', () async {
      //Arrange
      setUpMockHttpClientSuccess200('cocktail_info_list.json');
      //Act
      dataSource.getCocktailsBySearchResults(tSearchTerm);
      //Assert
      verify(mockHttpClient.get(
        'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=$tSearchTerm',
        headers: {'Content-Type': 'application/json'},
      ));
    });

    test('should return CocktailInfoListModel when the response code is 200 (success)', () async {
      //Arrange
      setUpMockHttpClientSuccess200('cocktail_info_list.json');
      //Act
      final result = await dataSource.getCocktailsBySearchResults(tSearchTerm);
      //Assert
      expect(result, equals(tCocktailInfoListModel));
    });

    test('should throw a ServerException when the response is code 404 or other', () async {
      //Arrange
      setUpMockHttpClientFailure404();
      //Act
      final call = dataSource.getCocktailsBySearchResults;
      //Assert
      expect(() => call(tSearchTerm), throwsA(TypeMatcher<ServerException>()));
    });
  });

  group('getCocktailsFilteredByCategory', () {
    final tCategory = 'test';
    final tPartialCocktailInfoListModel = PartialCocktailInfoListModel.fromJson(json.decode(fixture('partial_cocktail_info_list.json')));
    test('should preform a GET request on a URL to the endpoint c=$tCategory and with application/json header', () async {
      //Arrange
      setUpMockHttpClientSuccess200('partial_cocktail_info_list.json');
      //Act
      dataSource.getCocktailsFilteredByCategory(tCategory);
      //Assert
      verify(mockHttpClient.get(
        'https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=$tCategory',
        headers: {'Content-Type': 'application/json'},
      ));
    });

    test('should return PartialCocktailInfoListModel when the response code is 200 (success)', () async {
      //Arrange
      setUpMockHttpClientSuccess200('partial_cocktail_info_list.json');
      //Act
      final result = await dataSource.getCocktailsFilteredByCategory(tCategory);
      //Assert
      expect(result, equals(tPartialCocktailInfoListModel));
    });

    test('should throw a ServerException when the response is code 404 or other', () async {
      //Arrange
      setUpMockHttpClientFailure404();
      //Act
      final call = dataSource.getCocktailsFilteredByCategory;
      //Assert
      expect(() => call(tCategory), throwsA(TypeMatcher<ServerException>()));
    });
  });

  group('getCocktailsFilteredByGlass', () {
    final tGlass = 'test';
    final tPartialCocktailInfoListModel = PartialCocktailInfoListModel.fromJson(json.decode(fixture('partial_cocktail_info_list.json')));
    test('should preform a GET request on a URL to the endpoint g=glass and with application/json header', () async {
      //Arrange
      setUpMockHttpClientSuccess200('partial_cocktail_info_list.json');
      //Act
      dataSource.getCocktailsFilteredByGlass(tGlass);
      //Assert
      verify(mockHttpClient.get(
        'https://www.thecocktaildb.com/api/json/v1/1/filter.php?g=$tGlass',
        headers: {'Content-Type': 'application/json'},
      ));
    });

    test('should return PartialCocktailInfoListModel when the response code is 200 (success)', () async {
      //Arrange
      setUpMockHttpClientSuccess200('partial_cocktail_info_list.json');
      //Act
      final result = await dataSource.getCocktailsFilteredByGlass(tGlass);
      //Assert
      expect(result, equals(tPartialCocktailInfoListModel));
    });

    test('should throw a ServerException when the response is code 404 or other', () async {
      //Arrange
      setUpMockHttpClientFailure404();
      //Act
      final call = dataSource.getCocktailsFilteredByCategory;
      //Assert
      expect(() => call(tGlass), throwsA(TypeMatcher<ServerException>()));
    });
  });

  group('getCocktailsFilteredByIngredient', () {
    final tIngredient = 'test';
    final tPartialCocktailInfoListModel = PartialCocktailInfoListModel.fromJson(json.decode(fixture('partial_cocktail_info_list.json')));
    test('should preform a GET request on a URL to the endpoint i=ingredient and with application/json header', () async {
      //Arrange
      setUpMockHttpClientSuccess200('partial_cocktail_info_list.json');
      //Act
      dataSource.getCocktailsFilteredByIngredient(tIngredient);
      //Assert
      verify(mockHttpClient.get(
        'https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=$tIngredient',
        headers: {'Content-Type': 'application/json'},
      ));
    });

    test('should return PartialCocktailInfoListModel when the response code is 200 (success)', () async {
      //Arrange
      setUpMockHttpClientSuccess200('partial_cocktail_info_list.json');
      //Act
      final result = await dataSource.getCocktailsFilteredByIngredient(tIngredient);
      //Assert
      expect(result, equals(tPartialCocktailInfoListModel));
    });

    test('should throw a ServerException when the response is code 404 or other', () async {
      //Arrange
      setUpMockHttpClientFailure404();
      //Act
      final call = dataSource.getCocktailsFilteredByIngredient;
      //Assert
      expect(() => call(tIngredient), throwsA(TypeMatcher<ServerException>()));
    });
  });

  group('getGlasses', () {
    final tGlassesModel = GlassesModel.fromJson(json.decode(fixture('glasses.json')));
    test('should preform a GET request on a URL to the endpoint c=list and with application/json header', () async {
      //Arrange
      setUpMockHttpClientSuccess200('glasses.json');
      //Act
      dataSource.getGlasses();
      //Assert
      verify(mockHttpClient.get(
        'https://www.thecocktaildb.com/api/json/v1/1/list.php?g=list',
        headers: {'Content-Type': 'application/json'},
      ));
    });

    test('should return Glasses when the response code is 200 (success)', () async {
      //Arrange
      setUpMockHttpClientSuccess200('glasses.json');
      //Act
      final result = await dataSource.getGlasses();
      //Assert
      expect(result, equals(tGlassesModel));
    });

    test('should throw a ServerException when the response is code 404 or other', () async {
      //Arrange
      setUpMockHttpClientFailure404();
      //Act
      final call = dataSource.getGlasses;
      //Assert
      expect(() => call(), throwsA(TypeMatcher<ServerException>()));
    });
  });

  group('getIngredientInfoById', () {
    final tIngredientId = 1;
    final tIngredientInfoModel = IngredientInfoModel.fromJson(json.decode(fixture('ingredient_info.json')));
    test('should preform a GET request on a URL to the endpoint iid=id and with application/json header', () async {
      //Arrange
      setUpMockHttpClientSuccess200('ingredient_info.json');
      //Act
      dataSource.getIngredientInfoById(tIngredientId);
      //Assert
      verify(mockHttpClient.get(
        'https://www.thecocktaildb.com/api/json/v1/1/lookup.php?iid=$tIngredientId',
        headers: {'Content-Type': 'application/json'},
      ));
    });

    test('should return IngredientInfoModel when the response code is 200 (success)', () async {
      //Arrange
      setUpMockHttpClientSuccess200('ingredient_info.json');
      //Act
      final result = await dataSource.getIngredientInfoById(tIngredientId);
      //Assert
      expect(result, equals(tIngredientInfoModel));
    });

    test('should throw a ServerException when the response is code 404 or other', () async {
      //Arrange
      setUpMockHttpClientFailure404();
      //Act
      final call = dataSource.getIngredientInfoById;
      //Assert
      expect(() => call(tIngredientId), throwsA(TypeMatcher<ServerException>()));
    });
  });

  group('getIngredients', () {
    final tIngredientsModel = IngredientsModel.fromJson(json.decode(fixture('ingredients.json')));
    test('should preform a GET request on a URL to the endpoint c=list and with application/json header', () async {
      //Arrange
      setUpMockHttpClientSuccess200('ingredients.json');
      //Act
      dataSource.getIngredients();
      //Assert
      verify(mockHttpClient.get(
        'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list',
        headers: {'Content-Type': 'application/json'},
      ));
    });

    test('should return Ingredients when the response code is 200 (success)', () async {
      //Arrange
      setUpMockHttpClientSuccess200('ingredients.json');
      //Act
      final result = await dataSource.getIngredients();
      //Assert
      expect(result, equals(tIngredientsModel));
    });

    test('should throw a ServerException when the response is code 404 or other', () async {
      //Arrange
      setUpMockHttpClientFailure404();
      //Act
      final call = dataSource.getIngredients;
      //Assert
      expect(() => call(), throwsA(TypeMatcher<ServerException>()));
    });
  });

  group('getRandomCocktail', () {
    final tCocktailInfoModel = CocktailInfoModel.fromJson(json.decode(fixture('full_drink_info.json')));
    test('should preform a GET request on a URL to the endpoint random and with application/json header', () async {
      //Arrange
      setUpMockHttpClientSuccess200('full_drink_info.json');
      //Act
      dataSource.getRandomCocktialInfo();
      //Assert
      verify(mockHttpClient.get(
        'https://www.thecocktaildb.com/api/json/v1/1/random.php',
        headers: {'Content-Type': 'application/json'},
      ));
    });

    test('should return CocktailInfoModel when the response code is 200 (success)', () async {
      //Arrange
      setUpMockHttpClientSuccess200('full_drink_info.json');
      //Act
      final result = await dataSource.getRandomCocktialInfo();
      //Assert
      expect(result, equals(tCocktailInfoModel));
    });

    test('should throw a ServerException when the response is code 404 or other', () async {
      //Arrange
      setUpMockHttpClientFailure404();
      //Act
      final call = dataSource.getRandomCocktialInfo;
      //Assert
      expect(() => call(), throwsA(TypeMatcher<ServerException>()));
    });
  });
}
