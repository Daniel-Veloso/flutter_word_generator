import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:word_generator/src/controllers/home_controller.dart';
import 'package:word_generator/src/models/wordgenerator_model.dart';
import 'package:word_generator/src/repositories/wordgenerator_repository.dart';

class WordGeneratorRepositoryMock extends Mock implements WordGeneratorRepository{}

main(){
  final repository = WordGeneratorRepositoryMock();
  final controller = HomeController(repository);

  test('must fill object', () async{
    when(() => repository.fetchWordGenerator())
    .thenAnswer((_) async => WordGeneratorModel());

    await controller.start();
    expect(
      controller.wordGenerator.toString(), 
      WordGeneratorModel().toString()
    );
  });  
}