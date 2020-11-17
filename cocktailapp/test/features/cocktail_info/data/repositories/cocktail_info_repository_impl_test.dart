import 'package:cocktailapp/core/error/exception.dart';
import 'package:cocktailapp/core/error/failures.dart';
import 'package:cocktailapp/core/network/network_info.dart';
import 'package:cocktailapp/features/cocktail_info/data/datasources/cocktail_info_remote_data_source.dart';
import 'package:cocktailapp/features/cocktail_info/data/models/cocktail_info_list_model.dart';
import 'package:cocktailapp/features/cocktail_info/data/models/cocktail_info_model.dart';
import 'package:cocktailapp/features/cocktail_info/data/models/ingredient_info_model.dart';
import 'package:cocktailapp/features/cocktail_info/data/repositories/cocktail_info_repository_impl.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info_list.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/ingredient_info.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRemoteDataSource extends Mock implements CocktailInfoRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  CocktailInfoRepositoryImpl repositoryImpl;
  MockRemoteDataSource mockRemoteDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repositoryImpl = CocktailInfoRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

  group('getCategories', () {
    final tCategories = Categories(categories: [Category(category: 'test'), Category(category: 'test')]);

    test('should check if the device is online', () {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      repositoryImpl.getCategories();
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    runTestsOnline(() {
      test('should return remote data when the call to remote data source is successful', () async {
        //Arrange
        when(mockRemoteDataSource.getCategories()).thenAnswer((_) async => tCategories);
        //Act
        final result = await repositoryImpl.getCategories();
        //Assert
        verify(mockRemoteDataSource.getCategories());
        expect(result, Right(tCategories));
      });

      test('should return server failure when the call to remote data source is unsuccessful', () async {
        //Arrange
        when(mockRemoteDataSource.getCategories()).thenThrow(ServerException());
        //Act
        final result = await repositoryImpl.getCategories();
        //Assert
        verify(mockRemoteDataSource.getCategories());
        expect(result, equals(Left(ServerFailure())));
      });
    });

    runTestsOffline(() {
      test('should return NetworkFailure if device is not connected to a network', () async {
        //arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        // act
        final result = await repositoryImpl.getCategories();
        // assert
        verify(mockNetworkInfo.isConnected);
        expect(result, equals(Left(NetworkFailure())));
      });
    });
  });

  group('getCocktailInfoById', () {
    final int tCocktailId = 1;
    final tCocktailInfoModel = CocktailInfoModel(
      id: 1,
      name: 'Test',
      thumbnail: 'Test',
      category: 'Test',
      glass: 'Test',
      instructions: 'Test',
      ingredientsAndMeasurements: {
        'Test': 'Test',
        'Test2': 'Test2',
      },
    );
    final CocktailInfo tCocktailInfo = tCocktailInfoModel;

    test('should check if the device is online', () {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      repositoryImpl.getCocktailInfoById(tCocktailId);
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    runTestsOnline(() {
      test('should return remote data when the call to remote data source is successful', () async {
        //Arrange
        when(mockRemoteDataSource.getCocktailInfoById(tCocktailId)).thenAnswer((_) async => tCocktailInfoModel);
        //Act
        final result = await repositoryImpl.getCocktailInfoById(tCocktailId);
        //Assert
        verify(mockRemoteDataSource.getCocktailInfoById(tCocktailId));
        expect(result, Right(tCocktailInfo));
      });

      test('should return server failure when the call to remote data source is unsuccessful', () async {
        //Arrange
        when(mockRemoteDataSource.getCocktailInfoById(tCocktailId)).thenThrow(ServerException());
        //Act
        final result = await repositoryImpl.getCocktailInfoById(tCocktailId);
        //Assert
        verify(mockRemoteDataSource.getCocktailInfoById(tCocktailId));
        expect(result, equals(Left(ServerFailure())));
      });
    });

    runTestsOffline(() {
      test('should return NetworkFailure if device is not connected to a network', () async {
        //arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        // act
        final result = await repositoryImpl.getCocktailInfoById(tCocktailId);
        // assert
        verify(mockNetworkInfo.isConnected);
        expect(result, equals(Left(NetworkFailure())));
      });
    });
  });

  group('getCocktailsByFirstLetter', () {
    final String tLetter = 'a';
    final tCocktailInfoModel = CocktailInfoModel(
      id: 1,
      name: 'Test',
      thumbnail: 'Test',
      category: 'Test',
      glass: 'Test',
      instructions: 'Test',
      ingredientsAndMeasurements: {
        'Test': 'Test',
        'Test2': 'Test2',
      },
    );
    final CocktailInfoListModel tCocktailInfoListModel = CocktailInfoListModel(cocktailInfoList: [tCocktailInfoModel]);
    final CocktailInfoList tCocktailInfoList = tCocktailInfoListModel;

    test('should check if the device is online', () {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      repositoryImpl.getCocktailsByFirstLetter(tLetter);
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    runTestsOnline(() {
      test('should return remote data when the call to remote data source is successful', () async {
        //Arrange
        when(mockRemoteDataSource.getCocktailsByFirstLetter(tLetter)).thenAnswer((_) async => tCocktailInfoListModel);
        //Act
        final result = await repositoryImpl.getCocktailsByFirstLetter(tLetter);
        //Assert
        verify(mockRemoteDataSource.getCocktailsByFirstLetter(tLetter));
        expect(result, Right(tCocktailInfoList));
      });

      test('should return server failure when the call to remote data source is unsuccessful', () async {
        //Arrange
        when(mockRemoteDataSource.getCocktailsByFirstLetter(tLetter)).thenThrow(ServerException());
        //Act
        final result = await repositoryImpl.getCocktailsByFirstLetter(tLetter);
        //Assert
        verify(mockRemoteDataSource.getCocktailsByFirstLetter(tLetter));
        expect(result, equals(Left(ServerFailure())));
      });
    });

    runTestsOffline(() {
      test('should return NetworkFailure if device is not connected to a network', () async {
        //arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        // act
        final result = await repositoryImpl.getCocktailsByFirstLetter(tLetter);
        // assert
        verify(mockNetworkInfo.isConnected);
        expect(result, equals(Left(NetworkFailure())));
      });
    });
  });

  group('getCocktailsBySearchResults', () {
    final String tSearchTerm = 'Test';
    final tCocktailInfoModel = CocktailInfoModel(
      id: 1,
      name: 'Test',
      thumbnail: 'Test',
      category: 'Test',
      glass: 'Test',
      instructions: 'Test',
      ingredientsAndMeasurements: {
        'Test': 'Test',
        'Test2': 'Test2',
      },
    );
    final CocktailInfoListModel tCocktailInfoListModel = CocktailInfoListModel(cocktailInfoList: [tCocktailInfoModel]);
    final CocktailInfoList tCocktailInfoList = tCocktailInfoListModel;

    test('should check if the device is online', () {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      repositoryImpl.getCocktailsBySearchResults(tSearchTerm);
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    runTestsOnline(() {
      test('should return remote data when the call to remote data source is successful', () async {
        //Arrange
        when(mockRemoteDataSource.getCocktailsBySearchResults(tSearchTerm)).thenAnswer((_) async => tCocktailInfoListModel);
        //Act
        final result = await repositoryImpl.getCocktailsBySearchResults(tSearchTerm);
        //Assert
        verify(mockRemoteDataSource.getCocktailsBySearchResults(tSearchTerm));
        expect(result, Right(tCocktailInfoList));
      });

      test('should return server failure when the call to remote data source is unsuccessful', () async {
        //Arrange
        when(mockRemoteDataSource.getCocktailsBySearchResults(tSearchTerm)).thenThrow(ServerException());
        //Act
        final result = await repositoryImpl.getCocktailsBySearchResults(tSearchTerm);
        //Assert
        verify(mockRemoteDataSource.getCocktailsBySearchResults(tSearchTerm));
        expect(result, equals(Left(ServerFailure())));
      });
    });

    runTestsOffline(() {
      test('should return NetworkFailure if device is not connected to a network', () async {
        //arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        // act
        final result = await repositoryImpl.getCocktailsBySearchResults(tSearchTerm);
        // assert
        verify(mockNetworkInfo.isConnected);
        expect(result, equals(Left(NetworkFailure())));
      });
    });
  });

  group('getCocktailsFilteredByCategory', () {
    final String tCategory = 'Test';
    final tPartialCocktailInfoModel = PartialCocktailInfoModel(
      id: 1,
      name: 'Test',
      thumbnail: 'Test',
    );
    final PartialCocktailInfoListModel tPartialCocktailInfoListModel =
        PartialCocktailInfoListModel(partialCocktailInfoList: [tPartialCocktailInfoModel]);
    final PartialCocktailInfoList tPartialCocktailInfoList = tPartialCocktailInfoListModel;

    test('should check if the device is online', () {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      repositoryImpl.getCocktailsFilteredByCategory(tCategory);
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    runTestsOnline(() {
      test('should return remote data when the call to remote data source is successful', () async {
        //Arrange
        when(mockRemoteDataSource.getCocktailsFilteredByCategory(tCategory)).thenAnswer((_) async => tPartialCocktailInfoListModel);
        //Act
        final result = await repositoryImpl.getCocktailsFilteredByCategory(tCategory);
        //Assert
        verify(mockRemoteDataSource.getCocktailsFilteredByCategory(tCategory));
        expect(result, Right(tPartialCocktailInfoList));
      });

      test('should return server failure when the call to remote data source is unsuccessful', () async {
        //Arrange
        when(mockRemoteDataSource.getCocktailsFilteredByCategory(tCategory)).thenThrow(ServerException());
        //Act
        final result = await repositoryImpl.getCocktailsFilteredByCategory(tCategory);
        //Assert
        verify(mockRemoteDataSource.getCocktailsFilteredByCategory(tCategory));
        expect(result, equals(Left(ServerFailure())));
      });
    });

    runTestsOffline(() {
      test('should return NetworkFailure if device is not connected to a network', () async {
        //arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        // act
        final result = await repositoryImpl.getCocktailsFilteredByCategory(tCategory);
        // assert
        verify(mockNetworkInfo.isConnected);
        expect(result, equals(Left(NetworkFailure())));
      });
    });
  });

  group('getCocktailsFilteredByGlass', () {
    final String tGlass = 'Test';
    final tPartialCocktailInfoModel = PartialCocktailInfoModel(
      id: 1,
      name: 'Test',
      thumbnail: 'Test',
    );
    final PartialCocktailInfoListModel tPartialCocktailInfoListModel =
        PartialCocktailInfoListModel(partialCocktailInfoList: [tPartialCocktailInfoModel]);
    final PartialCocktailInfoList tPartialCocktailInfoList = tPartialCocktailInfoListModel;

    test('should check if the device is online', () {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      repositoryImpl.getCocktailsFilteredByGlass(tGlass);
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    runTestsOnline(() {
      test('should return remote data when the call to remote data source is successful', () async {
        //Arrange
        when(mockRemoteDataSource.getCocktailsFilteredByGlass(tGlass)).thenAnswer((_) async => tPartialCocktailInfoListModel);
        //Act
        final result = await repositoryImpl.getCocktailsFilteredByGlass(tGlass);
        //Assert
        verify(mockRemoteDataSource.getCocktailsFilteredByGlass(tGlass));
        expect(result, Right(tPartialCocktailInfoList));
      });

      test('should return server failure when the call to remote data source is unsuccessful', () async {
        //Arrange
        when(mockRemoteDataSource.getCocktailsFilteredByGlass(tGlass)).thenThrow(ServerException());
        //Act
        final result = await repositoryImpl.getCocktailsFilteredByGlass(tGlass);
        //Assert
        verify(mockRemoteDataSource.getCocktailsFilteredByGlass(tGlass));
        expect(result, equals(Left(ServerFailure())));
      });
    });

    runTestsOffline(() {
      test('should return NetworkFailure if device is not connected to a network', () async {
        //arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        // act
        final result = await repositoryImpl.getCocktailsFilteredByGlass(tGlass);
        // assert
        verify(mockNetworkInfo.isConnected);
        expect(result, equals(Left(NetworkFailure())));
      });
    });
  });

  group('getCocktailsFilteredByIngredient', () {
    final String tIngredient = 'Test';
    final tPartialCocktailInfoModel = PartialCocktailInfoModel(
      id: 1,
      name: 'Test',
      thumbnail: 'Test',
    );
    final PartialCocktailInfoListModel tPartialCocktailInfoListModel =
        PartialCocktailInfoListModel(partialCocktailInfoList: [tPartialCocktailInfoModel]);
    final PartialCocktailInfoList tPartialCocktailInfoList = tPartialCocktailInfoListModel;

    test('should check if the device is online', () {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      repositoryImpl.getCocktailsFilteredByIngredient(tIngredient);
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    runTestsOnline(() {
      test('should return remote data when the call to remote data source is successful', () async {
        //Arrange
        when(mockRemoteDataSource.getCocktailsFilteredByIngredient(tIngredient)).thenAnswer((_) async => tPartialCocktailInfoListModel);
        //Act
        final result = await repositoryImpl.getCocktailsFilteredByIngredient(tIngredient);
        //Assert
        verify(mockRemoteDataSource.getCocktailsFilteredByIngredient(tIngredient));
        expect(result, Right(tPartialCocktailInfoList));
      });

      test('should return server failure when the call to remote data source is unsuccessful', () async {
        //Arrange
        when(mockRemoteDataSource.getCocktailsFilteredByIngredient(tIngredient)).thenThrow(ServerException());
        //Act
        final result = await repositoryImpl.getCocktailsFilteredByIngredient(tIngredient);
        //Assert
        verify(mockRemoteDataSource.getCocktailsFilteredByIngredient(tIngredient));
        expect(result, equals(Left(ServerFailure())));
      });
    });

    runTestsOffline(() {
      test('should return NetworkFailure if device is not connected to a network', () async {
        //arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        // act
        final result = await repositoryImpl.getCocktailsFilteredByIngredient(tIngredient);
        // assert
        verify(mockNetworkInfo.isConnected);
        expect(result, equals(Left(NetworkFailure())));
      });
    });
  });

  group('getGlasses', () {
    final tGlassModel = GlassModel(glass: 'glass');
    final tGlassesModel = GlassesModel(glasses: [tGlassModel]);
    final Glasses tGlasses = tGlassesModel;

    test('should check if the device is online', () {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      repositoryImpl.getGlasses();
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    runTestsOnline(() {
      test('should return remote data when the call to remote data source is successful', () async {
        //Arrange
        when(mockRemoteDataSource.getGlasses()).thenAnswer((_) async => tGlassesModel);
        //Act
        final result = await repositoryImpl.getGlasses();
        //Assert
        verify(mockRemoteDataSource.getGlasses());
        expect(result, Right(tGlasses));
      });

      test('should return server failure when the call to remote data source is unsuccessful', () async {
        //Arrange
        when(mockRemoteDataSource.getGlasses()).thenThrow(ServerException());
        //Act
        final result = await repositoryImpl.getGlasses();
        //Assert
        verify(mockRemoteDataSource.getGlasses());
        expect(result, equals(Left(ServerFailure())));
      });
    });

    runTestsOffline(() {
      test('should return NetworkFailure if device is not connected to a network', () async {
        //arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        // act
        final result = await repositoryImpl.getGlasses();
        // assert
        verify(mockNetworkInfo.isConnected);
        expect(result, equals(Left(NetworkFailure())));
      });
    });
  });

  group('getIngredientInfoById', () {
    final int tIngredientId = 1;
    final tIngredientInfoModel = IngredientInfoModel(
      id: 1,
      name: 'Test',
      description: 'Test',
      type: 'Type',
      containsAlcohol: true,
      abbreviation: 'Test',
    );
    final IngredientInfo tIngredientInfo = tIngredientInfoModel;

    test('should check if the device is online', () {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      repositoryImpl.getIngredientInfoById(tIngredientId);
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    runTestsOnline(() {
      test('should return remote data when the call to remote data source is successful', () async {
        //Arrange
        when(mockRemoteDataSource.getIngredientInfoById(tIngredientId)).thenAnswer((_) async => tIngredientInfoModel);
        //Act
        final result = await repositoryImpl.getIngredientInfoById(tIngredientId);
        //Assert
        verify(mockRemoteDataSource.getIngredientInfoById(tIngredientId));
        expect(result, Right(tIngredientInfo));
      });

      test('should return server failure when the call to remote data source is unsuccessful', () async {
        //Arrange
        when(mockRemoteDataSource.getIngredientInfoById(tIngredientId)).thenThrow(ServerException());
        //Act
        final result = await repositoryImpl.getIngredientInfoById(tIngredientId);
        //Assert
        verify(mockRemoteDataSource.getIngredientInfoById(tIngredientId));
        expect(result, equals(Left(ServerFailure())));
      });
    });

    runTestsOffline(() {
      test('should return NetworkFailure if device is not connected to a network', () async {
        //arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        // act
        final result = await repositoryImpl.getIngredientInfoById(tIngredientId);
        // assert
        verify(mockNetworkInfo.isConnected);
        expect(result, equals(Left(NetworkFailure())));
      });
    });
  });

  group('getIngredients', () {
    final tIngredientModel = IngredientModel(ingredient: 'ingredient');
    final tIngredientsModel = IngredientsModel(ingredients: [tIngredientModel]);
    final Ingredients tIngredients = tIngredientsModel;

    test('should check if the device is online', () {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      repositoryImpl.getIngredients();
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    runTestsOnline(() {
      test('should return remote data when the call to remote data source is successful', () async {
        //Arrange
        when(mockRemoteDataSource.getIngredients()).thenAnswer((_) async => tIngredientsModel);
        //Act
        final result = await repositoryImpl.getIngredients();
        //Assert
        verify(mockRemoteDataSource.getIngredients());
        expect(result, Right(tIngredients));
      });

      test('should return server failure when the call to remote data source is unsuccessful', () async {
        //Arrange
        when(mockRemoteDataSource.getIngredients()).thenThrow(ServerException());
        //Act
        final result = await repositoryImpl.getIngredients();
        //Assert
        verify(mockRemoteDataSource.getIngredients());
        expect(result, equals(Left(ServerFailure())));
      });
    });

    runTestsOffline(() {
      test('should return NetworkFailure if device is not connected to a network', () async {
        //arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        // act
        final result = await repositoryImpl.getIngredients();
        // assert
        verify(mockNetworkInfo.isConnected);
        expect(result, equals(Left(NetworkFailure())));
      });
    });
  });

  group('getRandomCocktailInfo', () {
    final tCocktailInfoModel = CocktailInfoModel(
      id: 1,
      name: 'Test',
      thumbnail: 'Test',
      category: 'Test',
      glass: 'Test',
      instructions: 'Test',
      ingredientsAndMeasurements: {
        'Test': 'Test',
        'Test2': 'Test2',
      },
    );
    final CocktailInfo tCocktailInfo = tCocktailInfoModel;

    test('should check if the device is online', () {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      repositoryImpl.getRandomCocktailInfo();
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    runTestsOnline(() {
      test('should return remote data when the call to remote data source is successful', () async {
        //Arrange
        when(mockRemoteDataSource.getRandomCocktialInfo()).thenAnswer((_) async => tCocktailInfoModel);
        //Act
        final result = await repositoryImpl.getRandomCocktailInfo();
        //Assert
        verify(mockRemoteDataSource.getRandomCocktialInfo());
        expect(result, Right(tCocktailInfo));
      });

      test('should return server failure when the call to remote data source is unsuccessful', () async {
        //Arrange
        when(mockRemoteDataSource.getRandomCocktialInfo()).thenThrow(ServerException());
        //Act
        final result = await repositoryImpl.getRandomCocktailInfo();
        //Assert
        verify(mockRemoteDataSource.getRandomCocktialInfo());
        expect(result, equals(Left(ServerFailure())));
      });
    });

    runTestsOffline(() {
      test('should return NetworkFailure if device is not connected to a network', () async {
        //arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        // act
        final result = await repositoryImpl.getRandomCocktailInfo();
        // assert
        verify(mockNetworkInfo.isConnected);
        expect(result, equals(Left(NetworkFailure())));
      });
    });
  });
}
