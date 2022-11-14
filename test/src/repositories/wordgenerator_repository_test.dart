import 'package:flutter_test/flutter_test.dart';
import 'package:word_generator/src/models/wordgenerator_model.dart';
import 'package:word_generator/src/repositories/wordgenerator_repository.dart';

main(){
  final repository = WordGeneratorRepository(); 

  test('deve trazer o objeto', () async{
    final WordGeneratorModel obj = await repository.fetchWordGenerator();
    print(obj.slip?.advice);
  });
}