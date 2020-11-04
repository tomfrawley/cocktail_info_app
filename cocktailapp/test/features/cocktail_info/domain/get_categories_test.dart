import 'package:cocktailapp/core/usecases/usecase.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info_list.dart';
import 'package:cocktailapp/features/cocktail_info/domain/repositories/cocktail_info_repository.dart';
import 'package:cocktailapp/features/cocktail_info/domain/usecases/get_categories.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockCocktailInfoRepository extends Mock implements CocktailInfoRepository {}

void main() {
  GetCategories usecase;
  MockCocktailInfoRepository mockCocktailInfoRepository;

  setUp(() {
    mockCocktailInfoRepository = MockCocktailInfoRepository();
    usecase = GetCategories(mockCocktailInfoRepository);
  });

  final tCategories = Categories(categories: [Category(category: 'test category')]);

  test('should get Right(Categories) from the repository', () async {
    //Arrange
    when(mockCocktailInfoRepository.getCategories()).thenAnswer((realInvocation) async => Right(tCategories));
    //Act
    final result = await usecase(NoParams());
    //Assert
    expect(result, Right(tCategories));
    verify(mockCocktailInfoRepository.getCategories());
    verifyNoMoreInteractions(mockCocktailInfoRepository);
  });
}
