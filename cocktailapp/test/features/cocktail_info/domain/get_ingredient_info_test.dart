import 'package:cocktailapp/features/cocktail_info/domain/entities/ingredient_info.dart';
import 'package:cocktailapp/features/cocktail_info/domain/repositories/cocktail_info_repository.dart';
import 'package:cocktailapp/features/cocktail_info/domain/usecases/get_ingredient_info.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockCocktailInfoRepository extends Mock implements CocktailInfoRepository {}

void main() {
  GetIngredientInfo usecase;
  MockCocktailInfoRepository mockCocktailInfoRepository;

  setUp(() {
    mockCocktailInfoRepository = MockCocktailInfoRepository();
    usecase = GetIngredientInfo(mockCocktailInfoRepository);
  });

  final tIngredientName = 'test';
  final tIngredientInfo = IngredientInfo(
    id: 1,
    name: 'test',
    type: 'test',
    abbreviation: 'test',
    description: 'test',
    containsAlcohol: true,
  );

  test('should get Right(CocktailInfo) by the name from repository', () async {
    //Arrange
    when(mockCocktailInfoRepository.getIngredientInfo(tIngredientName)).thenAnswer((realInvocation) async => Right(tIngredientInfo));
    //Act
    final result = await usecase.execute(tIngredientName);
    //Assert
    expect(result, Right(tIngredientInfo));
    verify(mockCocktailInfoRepository.getIngredientInfo(tIngredientName));
    verifyNoMoreInteractions(mockCocktailInfoRepository);
  });
}
