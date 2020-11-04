import 'package:cocktailapp/core/usecases/usecase.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info_list.dart';
import 'package:cocktailapp/features/cocktail_info/domain/repositories/cocktail_info_repository.dart';
import 'package:cocktailapp/features/cocktail_info/domain/usecases/get_ingredients.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockCocktailInfoRepository extends Mock implements CocktailInfoRepository {}

void main() {
  GetIngredients usecase;
  MockCocktailInfoRepository mockCocktailInfoRepository;

  setUp(() {
    mockCocktailInfoRepository = MockCocktailInfoRepository();
    usecase = GetIngredients(mockCocktailInfoRepository);
  });

  final tIngredients = Ingredients(ingredients: [
    Ingredient(ingredientsAndMeasurements: {'test ingredient': ''})
  ]);

  test('should get Right(Ingredients) from the repository', () async {
    //Arrange
    when(mockCocktailInfoRepository.getIngredients()).thenAnswer((realInvocation) async => Right(tIngredients));
    //Act
    final result = await usecase(NoParams());
    //Assert
    expect(result, Right(tIngredients));
    verify(mockCocktailInfoRepository.getIngredients());
    verifyNoMoreInteractions(mockCocktailInfoRepository);
  });
}
