import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info_list.dart';
import 'package:cocktailapp/features/cocktail_info/domain/repositories/cocktail_info_repository.dart';
import 'package:cocktailapp/features/cocktail_info/domain/usecases/get_glasses.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockCocktailInfoRepository extends Mock implements CocktailInfoRepository {}

void main() {
  GetGlasses usecase;
  MockCocktailInfoRepository mockCocktailInfoRepository;

  setUp(() {
    mockCocktailInfoRepository = MockCocktailInfoRepository();
    usecase = GetGlasses(mockCocktailInfoRepository);
  });

  final tGlasses = Glasses(glasses: [Glass(glass: 'test glass')]);

  test('should get Right(Glasses) from the repository', () async {
    //Arrange
    when(mockCocktailInfoRepository.getGlasses()).thenAnswer((realInvocation) async => Right(tGlasses));
    //Act
    final result = await usecase.execute();
    //Assert
    expect(result, Right(tGlasses));
    verify(mockCocktailInfoRepository.getGlasses());
    verifyNoMoreInteractions(mockCocktailInfoRepository);
  });
}
