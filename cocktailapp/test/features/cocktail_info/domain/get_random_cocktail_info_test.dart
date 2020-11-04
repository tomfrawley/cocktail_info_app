import 'package:cocktailapp/core/usecases/usecase.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info.dart';
import 'package:cocktailapp/features/cocktail_info/domain/repositories/cocktail_info_repository.dart';
import 'package:cocktailapp/features/cocktail_info/domain/usecases/get_random_cocktail_info.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockCocktailInfoRepository extends Mock implements CocktailInfoRepository {}

void main() {
  GetRandomCocktailInfo usecase;
  MockCocktailInfoRepository mockCocktailInfoRepository;

  setUp(() {
    mockCocktailInfoRepository = MockCocktailInfoRepository();
    usecase = GetRandomCocktailInfo(mockCocktailInfoRepository);
  });

  final tCocktailInfo = CocktailInfo(
      id: 1,
      name: 'test',
      thumbnail: 'testThumb',
      category: 'testcat',
      glass: 'testglass',
      instructions: 'testInstruc',
      ingredientsAndMeasurements: {'test ingredients': 'test measures'});

  test('should get Right(CocktailInfo) of random cocktail info from repository', () async {
    //Arrange
    when(mockCocktailInfoRepository.getRandomCocktailInfo()).thenAnswer((realInvocation) async => Right(tCocktailInfo));
    //Act
    final result = await usecase(NoParams());
    //Assert
    expect(result, Right(tCocktailInfo));
    verify(mockCocktailInfoRepository.getRandomCocktailInfo());
    verifyNoMoreInteractions(mockCocktailInfoRepository);
  });
}
