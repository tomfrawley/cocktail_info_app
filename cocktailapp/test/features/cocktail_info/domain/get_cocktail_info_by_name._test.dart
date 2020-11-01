import 'package:cocktailapp/features/cocktail_info/domain/entities/drink_info.dart';
import 'package:cocktailapp/features/cocktail_info/domain/repositories/cocktail_info_repository.dart';
import 'package:cocktailapp/features/cocktail_info/domain/usecases/get_cocktail_info_by_name.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockCocktailInfoRepository extends Mock implements CocktailInfoRepository {}

void main() {
  GetCocktailInfoByName usecase;
  MockCocktailInfoRepository mockCocktailInfoRepository;

  setUp(() {
    mockCocktailInfoRepository = MockCocktailInfoRepository();
    usecase = GetCocktailInfoByName(mockCocktailInfoRepository);
  });

  final tCocktailName = 'test';
  final tCocktailInfo = CocktailInfo(
      id: 1,
      name: 'test',
      thumbnail: 'testThumb',
      category: 'testcat',
      glass: 'testglass',
      instructions: 'testInstruc',
      ingredientsAndMeasurements: [
        {'test ingredients': 'test measures'}
      ]);

  test('should get DrinkInfo for the name from repository', () async {
    //Arrange
    when(mockCocktailInfoRepository.getCocktailInfoByName(tCocktailName)).thenAnswer((realInvocation) async => Right(tCocktailInfo));
    //Act
    final result = await usecase.execute(tCocktailName);
    //Assert
    expect(result, Right(tCocktailInfo));
    verify(mockCocktailInfoRepository.getCocktailInfoByName(tCocktailName));
    verifyNoMoreInteractions(mockCocktailInfoRepository);
  });
}
